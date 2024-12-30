#!/usr/bin/env bash

set -e

if [[ -z "$1" ]]; then
  echo "You must pass the sandbox_name as the first argument"
  echo "usage: $0 SANDBOX_NAME [TERRAFORM_CMD]"
  exit 1
fi

cmd="apply"
if [[ -n "$2" ]]; then
  cmd="$2"
fi

terraform init -backend-config="path=$1/terraform.tfstate" -reconfigure
terraform "$cmd" -var sandbox_name="$1"
