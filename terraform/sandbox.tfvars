cf_space_name   = "capoc-rahearn"
env             = "staging"
host_name       = "capoc-saml"
allow_space_ssh = true
cf_user         = "ryan.ahearn@gsa.gov"
egress_allowlist = [
  "raw.githubusercontent.com", # download content previews
  "saml-proxy-sandbox.app.cloud.gov"
]
saml_proxy_host = "saml-proxy-sandbox.app.cloud.gov"
