data "archive_file" "src" {
  type        = "zip"
  source_dir  = "${path.module}/.."
  output_path = "${path.module}/dist/src.zip"
  excludes = [
    ".git*",
    "node_modules/*",
    "tmp/**/*",
    "terraform/*",
    "log/*",
    "doc/*"
  ]
}

resource "cloudfoundry_app" "app" {
  name       = "${local.app_name}-${var.env}"
  space_name = var.cf_space_name
  org_name   = local.cf_org_name

  path             = data.archive_file.src.output_path
  source_code_hash = data.archive_file.src.output_base64sha256
  buildpacks       = ["ruby_buildpack"]
  strategy         = "rolling"
  enable_ssh       = true

  environment = {
    no_proxy                 = "apps.internal,s3-fips.us-gov-west-1.amazonaws.com"
    RAILS_ENV                = var.env
    RAILS_MASTER_KEY         = var.rails_master_key
    RAILS_LOG_TO_STDOUT      = "true"
    RAILS_SERVE_STATIC_FILES = "true"
    SAML_PROXY_HOST          = var.saml_proxy_host
  }

  processes = [
    # {
    #   type      = "worker"
    #   instances = var.worker_instances
    #   memory    = var.worker_memory
    #   command   = "bundle exec sidekiq"
    # },
    {
      type                       = "web"
      instances                  = var.web_instances
      memory                     = var.web_memory
      health_check_http_endpoint = "/up"
      health_check_type          = "http"
      command                    = "./bin/rake cf:on_first_instance db:migrate && exec env HTTP_PORT=$PORT ./bin/thrust ./bin/rails server"
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
    module.app_space,
    module.database
  ]
}
