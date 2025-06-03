cf_space_name = "capoc-stage"
env           = "staging"
allow_ssh     = true
host_name     = "continuous-monitoring-staging"
space_developers = [
  "ryan.ahearn@gsa.gov"
]
egress_allowlist = [
  "raw.githubusercontent.com" # download content previews
]
