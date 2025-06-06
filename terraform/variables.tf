# Deploy user settings
variable "cf_user" {
  type        = string
  description = "The user email or service account running the terraform"
}

# app_space settings
variable "cf_space_name" {
  type        = string
  description = "The space name to deploy the app into"
}
variable "space_deployers" {
  type        = set(string)
  default     = []
  description = "A list of users to be granted SpaceDeveloper & SpaceManager on cf_space_name"
}
variable "space_developers" {
  type        = set(string)
  default     = []
  description = "A list of users to be granted SpaceDeveloper on cf_space_name"
}
variable "space_auditors" {
  type        = set(string)
  default     = []
  description = "A list of users to be granted SpaceAuditor on cf_space_name"
}
variable "allow_ssh" {
  type        = bool
  default     = false
  description = "Whether to allow ssh to the space and/or app"
}

# supporting services settings
variable "rds_plan_name" {
  type        = string
  default     = "micro-psql"
  description = "The name of the rds plan to create"
}

variable "redis_plan_name" {
  type        = string
  default     = "redis-dev"
  description = "The name of the redis plan to create"
}


# routing settings
variable "custom_domain_name" {
  type        = string
  default     = null
  description = "The custom domain name to associate with the app. Leave as null to disable the domain service and use an *.app.cloud.gov route"
}
variable "host_name" {
  type        = string
  default     = null
  description = "An optional hostname to prepend to either the custom domain name or app.cloud.gov"
}

# App environment settings
variable "env" {
  type        = string
  description = "The RAILS_ENV to set for the app (staging or production)"
}

variable "rails_master_key" {
  type        = string
  sensitive   = true
  description = "config/master.key"
}

variable "web_instances" {
  type        = number
  default     = 1
  description = "The number of instances of the web process"
}
variable "web_memory" {
  type        = string
  default     = "256M"
  description = "The amount of memory to assign to the web processes"
}

variable "worker_instances" {
  type        = number
  default     = 1
  description = "The number of instances of the worker process"
}
variable "worker_memory" {
  type        = string
  default     = "256M"
  description = "The amount of memory to assign to the worker processes"
}

variable "egress_allowlist" {
  type        = set(string)
  default     = []
  description = "The set of hostnames that the application is allowed to connect to"
}

variable "saml_proxy_host" {
  type        = string
  default     = "saml-proxy-staging.app.cloud.gov"
  description = "FQDN for saml-proxy app"
}
