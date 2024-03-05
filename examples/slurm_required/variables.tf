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
  default     = "us-east-1"
}

variable "profile" {
  type        = string
  description = "The aws profile used to deploy parallel clusters."
  default     = null
}

variable "endpoint" {
  type        = string
  description = "The endpoint used to deploy parallel clusters."
  default     = null
}

variable "role_arn" {
  type        = string
  description = "The role used to create parallel clusters."
  default     = null
}

variable "public_subnet_az" {
  type        = string
  description = "The az to create the public subnets in."
  default     = "us-east-1a"
}

variable "private_subnet_az" {
  type        = string
  description = "The az to create the private subnets in."
  default     = "us-east-1a"
}
