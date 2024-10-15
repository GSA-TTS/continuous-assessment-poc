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
  deployers     = [var.cf_user]
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
