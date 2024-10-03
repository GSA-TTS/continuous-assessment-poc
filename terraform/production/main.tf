locals {
  cf_org_name   = "gsa-tts-devtools-prototyping"
  cf_space_name = "rahearn"
  env           = "production"
  app_name      = "continuous_monitoring"
}

module "database" {
  source = "github.com/gsa-tts/terraform-cloudgov//database?ref=v1.0.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = local.cf_space_name
  name          = "${local.app_name}-rds-${local.env}"
  rds_plan_name = "TKTK-production-rds-plan"
}

module "redis" {
  source = "github.com/gsa-tts/terraform-cloudgov//redis?ref=v1.0.0"

  cf_org_name     = local.cf_org_name
  cf_space_name   = local.cf_space_name
  name            = "${local.app_name}-redis-${local.env}"
  redis_plan_name = "TKTK-production-redis-plan"
}



###########################################################################
# The following lines need to be commented out for the initial `terraform apply`
# It can be re-enabled after:
# 1) the app has first been deployed
# 2) the route has been manually created by an OrgManager:
#     `cf create-domain gsa-tts-devtools-prototyping TKTK-production-domain-name`
###########################################################################
# module "domain" {
#   source = "github.com/gsa-tts/terraform-cloudgov//domain?ref=v1.0.0"
#
#   cf_org_name    = local.cf_org_name
#   cf_space_name  = local.cf_space_name
#   app_name_or_id = "${local.app_name}-${local.env}"
#   cdn_plan_name  = "domain"
#   domain_name    = "TKTK-production-domain-name"
#   host_name      = "TKTK-production-hostname (optional)"
# }

module "egress_space" {
  source = "github.com/gsa-tts/terraform-cloudgov//cg_space?ref=v1.0.0"

  cf_org_name   = local.cf_org_name
  cf_space_name = "${local.cf_space_name}-egress"
  # deployers should include any user or service account ID that will deploy the egress proxy
  deployers = [
    var.cf_user
  ]
}
