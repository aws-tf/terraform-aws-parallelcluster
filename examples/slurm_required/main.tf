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
  source = "../../."

  parameters = {
    EnableIamAdminAccess = "true"
  }

  deploy_pcluster_api = true
  api_version         = "3.8.0"

  deploy_required_infra = true

  region          = "us-east-1"
  template_vars   = local.config_vars
  cluster_configs = local.cluster_configs
  config_path     = "files/pcluster-example-config.yaml"
}
