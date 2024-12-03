locals {
  cf_org_name   = "gsa-tts-devtools-prototyping"
  cf_space_name = "rahearn"
  env           = "staging"
  app_name      = "continuous_monitoring"
  allow_ssh     = true
}

module "app_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=migrate-provider"

  cf_org_name   = local.cf_org_name
  cf_space_name = local.cf_space_name
  allow_ssh     = local.allow_ssh
  deployers = [
    "0ee91aab-1041-494b-b315-307419a0eeac" # CI/CD deploy user
  ]
  # developers should include any users that will potentially need to run `cf ssh` on the app
  developers = ["ryan.ahearn@gsa.gov"]
}

module "database" {
  source = "github.com/gsa-tts/terraform-cloudgov//database?ref=migrate-provider"

  cf_space_id   = module.app_space.space_id
  name          = "${local.app_name}-rds-${local.env}"
  rds_plan_name = "micro-psql"
  # depends_on line is needed only for initial creation and destruction. It should be commented out for updates to prevent unwanted cascading effects
  # depends_on = [module.app_space]
}

# module "redis" {
#   source = "github.com/gsa-tts/terraform-cloudgov//redis?ref=v1.1.0"

#   cf_org_name     = local.cf_org_name
#   cf_space_name   = local.cf_space_name
#   name            = "${local.app_name}-redis-${local.env}"
#   redis_plan_name = "redis-dev"
#   # depends_on line is needed only for initial creation and destruction. It should be commented out for updates to prevent unwanted cascading effects
#   depends_on = [module.app_space]
# }

module "egress_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=migrate-provider"

  cf_org_name   = local.cf_org_name
  cf_space_name = "${local.cf_space_name}-egress"
  allow_ssh     = local.allow_ssh
  # deployers should include any user or service account ID that will deploy the egress proxy
  deployers = [
    "0ee91aab-1041-494b-b315-307419a0eeac" # CI/CD deploy user
  ]
  developers = ["ryan.ahearn@gsa.gov"]
}

module "egress_proxy" {
  source = "github.com/gsa-tts/terraform-cloudgov//egress_proxy?ref=migrate-provider"

  cf_org_name = local.cf_org_name
  cf_egress_space = {
    id   = module.egress_space.space_id
    name = module.egress_space.space_name
  }
  name      = "tfm-egress-proxy-${local.env}"
  allowlist = ["raw.githubusercontent.com"]
  # depends_on line is needed only for initial creation and destruction. It should be commented out for updates to prevent unwanted cascading effects
  # depends_on = [module.app_space, module.egress_space]
}

data "cloudfoundry_app" "app" {
  org_name   = local.cf_org_name
  space_name = local.cf_space_name
  name       = "${local.app_name}-${local.env}"
}

resource "cloudfoundry_network_policy" "egress_policy" {
  provider = cloudfoundry-community
  policy {
    source_app      = data.cloudfoundry_app.app.id
    destination_app = module.egress_proxy.app_id
    port            = module.egress_proxy.https_port
  }
}

resource "cloudfoundry_service_instance" "egress_proxy_credentials" {
  name        = "tfm-egress-proxy-${local.env}-creds"
  space       = module.app_space.space_id
  type        = "user-provided"
  credentials = module.egress_proxy.json_credentials
}
