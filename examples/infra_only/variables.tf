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

variable "region" {
  description = "The region the API gateway is deployed in."
  type        = string
  default     = null
}

variable "profile" {
  type        = string
  description = "The aws profile used to deploy parallel clusters."
  default     = null
}

## GENERAL ###############

variable "prefix" {
  type        = string
  description = "String to prefix to resource names."
  default     = "pcluster"
}

## VPCs ##################

variable "vpc_cidr_block" {
  type        = string
  description = "The cidr block of the vpc the cluster nodes will be created in. The public and private subnet cidr blocks should fall within this block."
  default     = "10.0.0.0/16"
}

## SUBNETs ###############

variable "public_subnet_cidrs" {
  type        = list(any)
  description = "List of cidr blocks to be used for public subnets. Has to be in the vpc cidr block. Cannot conflict with private subnets."
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(any)
  description = "List of cidr blocks to be used for private subnets. Has to be in the vpc cidr block. Cannot conflict with public subnets."
  default     = ["10.0.2.0/24"]
}
