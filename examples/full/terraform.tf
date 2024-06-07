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

terraform {
  required_version = ">=1.5.7"

  backend "s3" {
    # The 'bucket' attribute has been intentionally omitted so that 'terraform init' will prompt the user to specify it.
    # bucket = "INSERT_HERE_YOUR_BUCKET_NAME"
    key    = "terraform-aws-parallelcluster/examples/full/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    pcluster = {
      source  = "terraform.local/local/pcluster"
      version = "1.0.0-alpha"
    }
  }
}
