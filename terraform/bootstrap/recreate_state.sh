#!/usr/bin/env bash

if [ -f terraform.tfstate ]; then
  echo "Not overwriting existing state, remove terraform.tfstate manually first"
  exit 1
fi

terraform init
terraform import 'cloudfoundry_org_role.sa_org_manager' 1977aec2-b720-4c72-ae6e-9eacd94adcd4
terraform import 'cloudfoundry_service_credential_binding.bucket_creds' 38791219-5353-4345-91f1-4dd13942af7e
terraform import 'cloudfoundry_service_credential_binding.runner_sa_key' 671a08be-3fef-449d-8ca0-03e28f869d70
terraform import 'cloudfoundry_service_instance.runner_service_account' 72339f15-3499-4262-8b1b-10c85e1f4585
terraform import 'module.mgmt_space.cloudfoundry_space.space' 0d382490-25c9-44d0-9d77-4cd5d5b9e3b9
terraform import 'module.mgmt_space.cloudfoundry_space_role.developers["ryan.ahearn@gsa.gov"]' 74ff14fd-38a8-40d7-9c4d-a41975888cd5
terraform import 'module.s3.cloudfoundry_service_instance.bucket' c5623a00-4813-4203-8a0d-ae725a4c1846
terraform apply
