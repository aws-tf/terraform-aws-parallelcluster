/*
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

output "vpc" {
  description = "The VPC used for cluster nodes."
  value       = try(module.required_infra[0].vpc, null)
}

output "key_pair" {
  description = "The key pair created for use with AWS ParallelCluster."
  value       = try(module.required_infra[0].key_pair, null)
}

output "private_key" {
  description = "The private key used to create the key pair for use with the cluster."
  value       = try(module.required_infra[0].private_key, null)
}

output "public_subnets" {
  description = "Private subnets."
  value       = try(module.required_infra[0].public_subnets, null)
}

output "private_subnets" {
  description = "Public subnets."
  value       = try(module.required_infra[0].private_subnets, null)
}

output "parallelcluster" {
  description = "The ParallelCluster API Cloudformation Stack outputs. Refer to the ParallelCluster documentation to see available outputs."
  value       = try(module.pcluster_api[0].parallelcluster, null)
}

output "clusters" {
  description = "The ParallelCluster clusters."
  value       = try(module.clusters[0].managed, null)
}
