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
  profile  = "AWS_868024899531_iesawsna-sandbox"
}

run "test_parallelcluster_plan" {
  
  variables {
    name = "Test_Cluster"
  }  

  command = plan

  assert {
    condition = aws_cloudformation_stack.parallelcluster.name == "Test_Cluster" 
    error_message = "ParallelCluster API name does not equal Test_Cluster."
  }
}
