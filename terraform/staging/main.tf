locals {
  cf_org_name   = "gsa-tts-devtools-prototyping"
  cf_space_name = "rahearn"
  env           = "staging"
  app_name      = "continuous_monitoring"
}

module "app_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=v1.1.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = local.cf_space_name
  deployers     = [var.cf_user, "0ee91aab-1041-494b-b315-307419a0eeac"]
  # developers should include any users that will potentially need to run `cf ssh` on the app
  developers = ["ryan.ahearn@gsa.gov"]
}

module "database" {
  source = "github.com/gsa-tts/terraform-cloudgov//database?ref=v1.1.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = local.cf_space_name
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
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=v1.1.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = "${local.cf_space_name}-egress"
  # deployers should include any user or service account ID that will deploy the egress proxy
  deployers = [
    var.cf_user,
    "0ee91aab-1041-494b-b315-307419a0eeac"
  ]
  developers = ["ryan.ahearn@gsa.gov"]
}

module "egress_proxy" {
  source = "github.com/gsa-tts/terraform-cloudgov//egress_proxy?ref=v1.1.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = module.egress_space.space_name
  client_space  = local.cf_space_name
  name          = "tfm-egress-proxy-${local.env}"
  # comment out allowlist if this module is being deployed before the app has ever been deployed
  allowlist = {
    "${local.app_name}-${local.env}" = ["raw.githubusercontent.com"]
  }
  # depends_on line is needed only for initial creation and destruction. It should be commented out for updates to prevent unwanted cascading effects
  # depends_on = [module.app_space, module.egress_space]
}
