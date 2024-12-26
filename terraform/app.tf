data "archive_file" "src" {
  type        = "zip"
  source_dir  = "${path.module}/.."
  output_path = "${path.module}/dist/src.zip"
  excludes = [
    "node_modules/*",
    "tmp/**/*",
    "terraform/*",
    "log/*",
    "doc/*"
  ]
}

locals {
  host_name = coalesce(var.host_name, "${local.app_name}-${var.env}")
  domain    = coalesce(var.custom_domain_name, "app.cloud.gov")
}

resource "cloudfoundry_app" "app" {
  name       = "${local.app_name}-${var.env}"
  space_name = module.app_space.space_name
  org_name   = local.cf_org_name

  path             = data.archive_file.src.output_path
  source_code_hash = data.archive_file.src.output_base64sha256
  buildpacks       = ["ruby_buildpack"]
  strategy         = "blue-green"
  routes           = [{ route = "${local.host_name}.${local.domain}" }]

  environment = {
    no_proxy                 = "apps.internal,s3-fips.us-gov-west-1.amazonaws.com"
    RAILS_ENV                = var.env
    RAILS_MASTER_KEY         = var.rails_master_key
    RAILS_LOG_TO_STDOUT      = "true"
    RAILS_SERVE_STATIC_FILES = "true"
  }

  processes = [
    # {
    #   type      = "worker"
    #   instances = var.worker_instances
    #   memory    = var.worker_memory
    #   command   = "bundle exec sidekiq"
    # },
    {
      type      = "web"
      instances = var.web_instances
      memory    = var.web_memory
      command   = "bundle exec rake cf:on_first_instance db:migrate && exec bundle exec rails s -b 0.0.0.0 -p $PORT -e $RAILS_ENV"
    }
  ]

  service_bindings = [
    { service_instance = "egress-proxy-${var.env}-credentials" },
    # { service_instance = "${local.app_name}-redis-${var.env}" },
    { service_instance = "${local.app_name}-rds-${var.env}" }
  ]

  depends_on = [
    cloudfoundry_service_instance.egress_proxy_credentials,
    # module.redis,
    module.database,
    module.app_space
  ]
}