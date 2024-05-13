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

run "test_slurm_required_plan" {

  command = plan

  variables {
    api_version = "3.9.1"

    # The test assumes that a PCAPI and a KeyPair exist with the below names.
    api_stack_name = "ParallelCluster"
    keypair_id     = "aws-parallelcluster-terraform-test"
  }

  assert {
    condition     = var.region == "us-east-1"
    error_message = "Region did not default to us-east-1"
  }
}
