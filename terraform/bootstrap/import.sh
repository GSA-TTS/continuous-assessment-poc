#!/usr/bin/env bash

read -p "Are you sure you want to import terraform state (y/n)? " verify

if [[ $verify == "y" ]]; then
  echo "Importing bootstrap state"
  ./run.sh init
  ./run.sh import module.s3.cloudfoundry_service_instance.bucket a26c2475-be53-4b1d-a61c-240530426fde
  ./run.sh import cloudfoundry_service_key.bucket_creds b2e6d07e-d72a-4880-b364-c9d39e87d5db
  ./run.sh plan
else
  echo "Not importing bootstrap state"
fi
