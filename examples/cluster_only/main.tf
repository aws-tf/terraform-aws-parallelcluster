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

module "pcluster" {
  source                = "../../."
  deploy_pcluster_api   = false
  deploy_required_infra = false
  region                = var.region
  api_stack_name        = var.api_stack_name
  api_version           = var.api_version
  template_vars         = local.config_vars
  config_path           = "files/pcluster-example-config.yaml"
}
