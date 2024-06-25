#!/usr/bin/env bash

../../bin/ops/destroy_service_account.sh -s rahearn -u config-bootstrap-deployer

rm secrets.auto.tfvars
