#!/usr/bin/env bash

if ! command -v jq &> /dev/null
then
  echo "jq must be installed. Run 'brew bundle' to install everything in the Brewfile"
  exit 1
fi
if ! command -v terraform &> /dev/null
then
  echo "terraform must be installed before running this script"
  exit 1
fi

dig_output () {
  dig_result=`cat terraform.tfstate | jq -r ".outputs.bucket_credentials.value.$1"`
}

if [[ ! -f "secrets.auto.tfvars" ]]; then
  cf target -s rahearn-mgmt || cf create-space rahearn-mgmt && cf disallow-space-ssh rahearn-mgmt
  ../../bin/ops/create_service_account.sh -s rahearn-mgmt -u config-bootstrap-deployer > secrets.auto.tfvars
fi

if [[ $# -gt 0 ]]; then
  echo "Running terraform $@"
  terraform $@
  if [[ -f terraform.tfstate ]]; then
    echo
    echo "Credentials for terraform state bucket:"
    dig_output "bucket"
    echo "BUCKET=$dig_result"
    dig_output "access_key_id"
    echo "AWS_ACCESS_KEY_ID=$dig_result"
    dig_output "secret_access_key"
    echo "AWS_SECRET_ACCESS_KEY=$dig_result"
    dig_output "region"
    echo "AWS_REGION=$dig_result"
  fi
else
  echo "Not running terraform"
fi
