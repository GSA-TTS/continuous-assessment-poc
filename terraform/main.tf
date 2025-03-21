locals {
  cf_org_name     = "gsa-tts-devtools-prototyping"
  app_name        = "continuous_monitoring"
  space_deployers = setunion([var.cf_user], var.space_deployers)
}

module "app_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=v2.2.0"

  cf_org_name          = local.cf_org_name
  cf_space_name        = var.cf_space_name
  allow_ssh            = var.allow_space_ssh
  deployers            = local.space_deployers
  developers           = var.space_developers
  security_group_names = ["trusted_local_networks_egress"]
}

module "database" {
  source = "github.com/gsa-tts/terraform-cloudgov//database?ref=v2.2.0"

  cf_space_id   = module.app_space.space_id
  name          = "${local.app_name}-rds-${var.env}"
  rds_plan_name = var.rds_plan_name
  # depends_on line is required only for initial creation and destruction. It can be commented out for updates if you see unwanted cascading effects
  depends_on = [module.app_space]
}

# module "redis" {
#   source = "github.com/gsa-tts/terraform-cloudgov//redis?ref=v2.2.0"

#   cf_space_id     = module.app_space.space_id
#   name            = "${local.app_name}-redis-${var.env}"
#   redis_plan_name = var.redis_plan_name
#   # depends_on line is required only for initial creation and destruction. It can be commented out for updates if you see unwanted cascading effects
#   depends_on = [module.app_space]
# }



###########################################################################
# Before setting var.custom_domain_name, perform the following steps:
# 1) Domain must be manually created by an OrgManager:
#     cf create-domain var.cf_org_name var.domain_name
# 2) ACME challenge record must be created.
#     See https://cloud.gov/docs/services/external-domain-service/#how-to-create-an-instance-of-this-service
###########################################################################
module "domain" {
  count  = (var.custom_domain_name == null ? 0 : 1)
  source = "github.com/gsa-tts/terraform-cloudgov//domain?ref=v2.2.0"

  cf_org_name   = local.cf_org_name
  cf_space      = module.app_space.space
  cdn_plan_name = "domain"
  domain_name   = var.custom_domain_name
  host_name     = var.host_name
  # depends_on line is required only for initial creation and destruction. It can be commented out for updates if you see unwanted cascading effects
  depends_on = [module.app_space]
}

module "egress_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=v2.2.0"

  cf_org_name          = local.cf_org_name
  cf_space_name        = "${var.cf_space_name}-egress"
  allow_ssh            = var.allow_space_ssh
  deployers            = local.space_deployers
  developers           = var.space_developers
  security_group_names = ["public_networks_egress"]
}

module "egress_proxy" {
  source = "github.com/gsa-tts/terraform-cloudgov//egress_proxy?ref=206ee1a196406a9f29a08aef57da88552400752b" #v2.2.0

  cf_org_name     = local.cf_org_name
  cf_egress_space = module.egress_space.space
  name            = "egress-proxy-${var.env}"
  allowlist       = var.egress_allowlist
  gitref          = "1500c67157c1a7a6fbbda7a2de172b3d0a67e703"
  # depends_on line is needed only for initial creation and destruction. It should be commented out for updates to prevent unwanted cascading effects
  depends_on = [module.app_space, module.egress_space]
}

resource "cloudfoundry_network_policy" "egress_routing" {
  provider = cloudfoundry-community
  policy {
    source_app      = cloudfoundry_app.app.id
    destination_app = module.egress_proxy.app_id
    port            = "61443"
  }
  policy {
    source_app      = cloudfoundry_app.app.id
    destination_app = module.egress_proxy.app_id
    port            = "8080"
  }
}

resource "cloudfoundry_service_instance" "egress_proxy_credentials" {
  name        = "egress-proxy-${var.env}-credentials"
  space       = module.app_space.space_id
  type        = "user-provided"
  credentials = module.egress_proxy.json_credentials
  # depends_on line is needed only for initial creation and destruction. It should be commented out for updates to prevent unwanted cascading effects
  depends_on = [module.app_space]
}
