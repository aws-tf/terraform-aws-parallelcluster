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

run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "test_cluster_only_plan" {

  command = plan

  variables {
    api_version = "3.9.1"

    # The test assumes that a PCAPI and a KeyPair exist with the below names.
    api_stack_name = "ParallelCluster"
    keypair_id     = "aws-parallelcluster-terraform-test"
    subnet_id      = run.setup_tests.subnet_id
  }

  assert {
    condition     = var.region == "us-east-1"
    error_message = "Region did not default to us-east-1"
  }
}
