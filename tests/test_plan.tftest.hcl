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

variables {}

provider "aws" {
  region = "us-east-1"
}

provider "pcluster" {
  endpoint = "null"
  region   = "us-east-1"
}

run "test_required_infra_plan" {

  variables {
    deploy_required_infra = true
    deploy_pcluster_api   = false
    cluster_configs       = {}
    api_version           = "3.9.1"
  }

  command = plan

  assert {
    condition     = length(module.required_infra) == 1
    error_message = "The deploy_required_infra variable did not trigger the required infra module."
  }

  assert {
    condition     = length(module.pcluster_api) == 0
    error_message = "The ParallelCluster API module should not exist when var.deploy_pcluster_api is set to false."
  }

  assert {
    condition     = length(module.clusters) == 0
    error_message = "Cluster module should not deploy when the cluster_configs variable is empty."
  }
}

run "test_pcluster_api_plan" {

  variables {
    deploy_required_infra = false
    deploy_pcluster_api   = true
    cluster_configs       = {}
    api_version           = "3.9.1"
  }

  command = plan

  assert {
    condition     = length(module.required_infra) == 0
    error_message = "The required infra module should not exist when var.deploy_required_infra is set to false."
  }

  assert {
    condition     = length(module.pcluster_api) == 1
    error_message = "The ParallelCluster API module should exist when var.deploy_pcluster_api is set to true."
  }

  assert {
    condition     = length(module.clusters) == 0
    error_message = "Cluster module should not deploy when the cluster_configs variable is empty."
  }
}
