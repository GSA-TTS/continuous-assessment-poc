locals {
  cf_org_name   = "gsa-tts-devtools-prototyping"
  cf_space_name = "rahearn"
  env           = "staging"
  app_name      = "continuous_monitoring"
}

module "database" {
  source = "github.com/gsa-tts/terraform-cloudgov//database?ref=v1.0.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = local.cf_space_name
  name          = "${local.app_name}-rds-${local.env}"
  rds_plan_name = "micro-psql"
}

module "redis" {
  source = "github.com/gsa-tts/terraform-cloudgov//redis?ref=v1.0.0"

  cf_org_name     = local.cf_org_name
  cf_space_name   = local.cf_space_name
  name            = "${local.app_name}-redis-${local.env}"
  redis_plan_name = "redis-dev"
}

module "egress_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=v1.0.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = "${local.cf_space_name}-egress"
  deployers     = ["ryan.ahearn@gsa.gov", var.cf_user]
}
