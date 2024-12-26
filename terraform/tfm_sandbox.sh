#!/usr/bin/env bash


sandbox="sandbox"

if [[ $# = 0 ]]; then
  echo "Usage: $0 <terraform command> [<sandbox var file name>]"
  exit 1
fi

if [[ $# > 1 ]]; then
  sandbox="$2"
fi

terraform "$1" -var-file="$sandbox.tfvars" -var rails_master_key=$(cat ../config/master.key)
