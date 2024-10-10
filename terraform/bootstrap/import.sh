#!/usr/bin/env bash

read -p "Are you sure you want to import terraform state (y/n)? " verify

if [[ $verify == "y" ]]; then
  echo "Importing bootstrap state"
  ./run.sh init
  ./run.sh import module.s3.cloudfoundry_service_instance.bucket 7ecc7fa5-6da9-4df7-bfbc-59d957a2d61e
  ./run.sh import cloudfoundry_service_key.bucket_creds da42df77-ee50-43ba-87a7-ecedd872620d
  ./run.sh plan
else
  echo "Not importing bootstrap state"
fi
