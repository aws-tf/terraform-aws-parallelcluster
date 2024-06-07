/**
 *  Copyright 2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"). You may not
 *  use this file except in compliance with the License. A copy of the License is
 *  located at
 *
 *  http://aws.amazon.com/apache2.0/
 *
 *  or in the "LICENSE.txt" file accompanying this file. This file is distributed
 *  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
 *  implied. See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

resource "random_id" "suffix" {
  byte_length = 8
}

module "pcluster" {
  source = "../../."

  parameters = {
    EnableIamAdminAccess = "true"
  }

  deploy_pcluster_api = true
  api_stack_name      = var.api_stack_name != null ? var.api_stack_name : "PClusterApi-${random_id.suffix.hex}"
  api_version         = var.api_version

  deploy_required_infra = true
  public_subnet_az      = var.public_subnet_az
  private_subnet_az     = var.private_subnet_az

  region          = var.region
  template_vars   = local.config_vars
  cluster_configs = local.cluster_configs
  config_path     = "files/pcluster-example-config.yaml"
}
