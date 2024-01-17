/**
 *  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

variables {}

provider "pcluster" {
  endpoint = "null"
  region = "us-east-1"
  profile  = "AWS_868024899531_iesawsna-sandbox"
}

run "test_managed_file_configs_plan" {
  
  variables {}  

  command = plan

  assert {
    condition = length(pcluster_cluster.managed_file_configs) == 0
    error_message = "pcluster_cluster.managed_file_configs should not exist with configs are not present."
  }
}

run "test_managed_configs_plan" {
  
  variables {}  

  command = plan

  assert {
    condition = length(pcluster_cluster.managed_configs) == 0
    error_message = "pcluster_cluster.managed_file_configs should not exist with configs are not present."
  }
}
