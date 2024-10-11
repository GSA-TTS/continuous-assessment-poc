locals {
  cf_org_name   = "gsa-tts-devtools-prototyping"
  cf_space_name = "rahearn"
  env           = "staging"
  app_name      = "continuous_monitoring"
}

module "app_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=cg-space-asg"

  cf_org_name   = local.cf_org_name
  cf_space_name = local.cf_space_name
  allow_ssh     = false
  # deployers should include any user or service account ID that will deploy the app
  deployers  = ["ryan.ahearn@gsa.gov"]
  developers = [var.cf_user]
  asg_names  = ["trusted_local_networks_egress"]
}

module "database" {
  source = "github.com/gsa-tts/terraform-cloudgov//database?ref=v1.0.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = local.cf_space_name
  name          = "${local.app_name}-rds-${local.env}"
  rds_plan_name = "micro-psql"
  depends_on    = [module.app_space]
}

# module "redis" {
#   source = "github.com/gsa-tts/terraform-cloudgov//redis?ref=v1.0.0"

#   cf_org_name     = local.cf_org_name
#   cf_space_name   = local.cf_space_name
#   name            = "${local.app_name}-redis-${local.env}"
#   redis_plan_name = "redis-dev"
#   depends_on      = [module.app_space]
# }

module "egress_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=cg-space-asg"

  cf_org_name   = local.cf_org_name
  cf_space_name = "${local.cf_space_name}-egress"
  allow_ssh     = false
  # deployers should include any user or service account ID that will deploy the egress proxy
  deployers  = ["ryan.ahearn@gsa.gov"]
  developers = [var.cf_user]
  asg_names  = ["public_networks_egress"]
}

module "egress_proxy" {
  source = "github.com/gsa-tts/terraform-cloudgov//egress_proxy?ref=main"

  cf_org_name   = local.cf_org_name
  cf_space_name = module.egress_space.space_name
  client_space  = local.cf_space_name
  name          = "tfm-egress-proxy-${local.env}"
  # allowlist = {
  # "${local.app_name}-${local.env}" = ["raw.githubusercontent.com"]
  # }
  depends_on = [module.app_space, module.egress_space]
}
