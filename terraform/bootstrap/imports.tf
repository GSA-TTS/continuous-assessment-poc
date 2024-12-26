# This file takes care of importing bootstrap
# resources onto a new developer's machine if needed
# import happens automatically on a normal ./apply.sh run

import {
  to = cloudfoundry_org_role.sa_org_manager
  id = "7328140d-1768-4d6e-873d-7ad92dc146c8"
}
import {
  to = cloudfoundry_service_credential_binding.bucket_creds
  id = "fea67b58-a1d6-4675-9e82-daeb98f92ddd"
}
import {
  to = cloudfoundry_service_credential_binding.runner_sa_key
  id = "a6885c8a-c011-4d34-b988-abc8033d138f"
}
import {
  to = cloudfoundry_service_instance.runner_service_account
  id = "5ed504a3-e8c5-4f1d-ab07-9535d85fb760"
}
import {
  to = module.mgmt_space.cloudfoundry_space.space
  id = "0ca72638-b4f5-49e2-9e96-f3788d2e5ca4"
}
import {
  to = module.s3.cloudfoundry_service_instance.bucket
  id = "4ebb88c4-a5d8-4e3a-a028-e435382d4f50"
}

locals {
  developer_import_map = "{\"ryan.ahearn@gsa.gov\":\"3a2bb005-393b-48a2-8cff-15bcaf86e71f\"}"
  manager_import_map   = "{}"
}
import {
  for_each = jsondecode(local.developer_import_map)
  to       = module.mgmt_space.cloudfoundry_space_role.developers[each.key]
  id       = each.value
}
import {
  for_each = jsondecode(local.manager_import_map)
  to       = module.mgmt_space.cloudfoundry_space_role.managers[each.key]
  id       = each.value
}
