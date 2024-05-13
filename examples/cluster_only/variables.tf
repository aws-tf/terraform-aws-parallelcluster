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

variable "cluster_region" {
  description = "The region the clusters will be deployed in."
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  type        = string
  description = "The aws profile used to deploy parallel clusters."
  default     = null
}

variable "keypair_id" {
  type        = string
  description = "The id of the keypair to be used for the ParallelCluster instances."
}

variable "subnet_id" {
  type        = string
  description = "The id of the subnet to be used for the ParallelCluster instances."
}

variable "api_stack_name" {
  type        = string
  description = "The name of the cloudformation stack that deployed the ParallelCluster API."
  default     = "ParallelCluster"
}

variable "api_version" {
  type        = string
  description = "Version of the ParallelCluster API to deploy."
}
