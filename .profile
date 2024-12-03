##
# Cloud Foundry app initialization script
# https://docs.cloudfoundry.org/devguide/deploy-apps/deploy-app.html#profile
##

egress_proxy=`jq -r ".\"user-provided\"[] | select(.name == \"tfm-egress-proxy-$RAILS_ENV-creds\") | .credentials.https_uri" <<< $VCAP_SERVICES`
export http_proxy="$egress_proxy"
export https_proxy="$egress_proxy"
