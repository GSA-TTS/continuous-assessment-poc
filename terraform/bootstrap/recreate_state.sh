#!/usr/bin/env bash

if [ -f terraform.tfstate ]; then
  echo "Not overwriting existing state, remove terraform.tfstate manually first"
  exit 1
fi

terraform init
terraform import 'cloudfoundry_org_role.sa_org_manager' b7a45415-d471-4d5c-b600-8716eb5810df
terraform import 'cloudfoundry_service_credential_binding.bucket_creds' b4493ebc-8534-4bf1-bfbd-f85b4e327b1b
terraform import 'cloudfoundry_service_credential_binding.runner_sa_key' cee6f8d4-39a3-4b81-951f-f073dd9e61fa
terraform import 'cloudfoundry_service_instance.runner_service_account' fe7904e2-68b2-4adf-adce-0fbccd3bf18b
terraform import 'module.mgmt_space.cloudfoundry_space.space' 5d1625d9-026b-47c4-a0f6-9c47d719ef8d
terraform import 'module.mgmt_space.cloudfoundry_space_role.developers["ryan.ahearn@gsa.gov"]' 5d89e0df-d0ac-4fe2-a381-0d3338982849
terraform import 'module.s3.cloudfoundry_service_instance.bucket' 914edcc8-9133-4116-bbd4-19e28acca986
terraform apply
