##
# Cloud Foundry app initialization script
# https://docs.cloudfoundry.org/devguide/deploy-apps/deploy-app.html#profile
##

proxy_creds=$(echo "$VCAP_SERVICES" | jq --arg service_name "egress-proxy-$RAILS_ENV-credentials" '.[][] | select(.name == $service_name) | .credentials')
export http_proxy=$(echo "$proxy_creds" | jq --raw-output ".http_uri")
export https_proxy=$(echo "$proxy_creds" | jq --raw-output ".https_uri")
