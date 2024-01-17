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

provider "aws" {
  region = "us-east-1"
  profile  = "AWS_868024899531_iesawsna-sandbox"
}

run "test_key_plan" {
  
  variables {}  

  command = plan

  assert {
    condition = tls_private_key.key.algorithm == "ED25519" 
    error_message = "TLS private key should use te ED25591 algorithm."
  }
}

run "test_key_pair_plan" {
  
  variables {
    prefix = "some_prefix"
  }  

  command = plan

  assert {
    condition = aws_key_pair.key_pair.key_name_prefix == "some_prefix" 
    error_message = "Key name prefix is incorrect."
  }
}

run "test_aws_default_vpc_plan" {
  
  variables {}  

  command = plan

  assert {
    condition = length(aws_default_vpc.default) > 0
    error_message = "Default VPC does not exist."
  }
}

run "test_vpc_plan" {
  
  variables {
    vpc_cidr_block = "10.1.0.0/16"
  }  

  command = plan

  assert {
    condition = aws_vpc.vpc.cidr_block == var.vpc_cidr_block 
    error_message = "Incorrect cidr block."
  }
}

run "test_aws_subnet_public_plan" {
  
  variables {
    public_subnet_cidrs = ["10.0.9.0/24"]
  }  

  command = plan

  assert {
    condition = length(aws_subnet.public) == 1 
    error_message = "Public subnet count is not equal to 1."
  }
  assert {
    condition = aws_subnet.public[0].cidr_block == var.public_subnet_cidrs[0]
    error_message = "Incorrect subnet."
  }
}

run "test_aws_subnet_private_plan" {
  
  variables {
    private_subnet_cidrs = ["10.0.9.0/24"]
  }  

  command = plan

  assert {
    condition = length(aws_subnet.private) == 1 
    error_message = "Private subnet count is not equal to 1."
  }
  assert {
    condition = aws_subnet.private[0].cidr_block == var.private_subnet_cidrs[0]
    error_message = "Incorrect subnet."
  }
}

run "test_aws_nat_gateway_plan" {

  variables {}

  command = plan
  
  assert {
    condition = length(aws_nat_gateway.nat_gateway) > 0
    error_message = "Missing nat gateway."
  }
}

run "test_route_table_plan" {
  
  variables {}
  
  command = plan
  
  assert {
    condition = length(aws_route_table_association.public) == length(aws_subnet.public)
    error_message = "Not all public subnets exist in the route table."
  } 
  assert {
    condition = length(aws_route_table_association.private) == length(aws_subnet.private)
    error_message = "Not all private subnets exist in the route table."
  } 

}
