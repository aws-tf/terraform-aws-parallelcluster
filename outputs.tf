output "vpc" {
  description = "The VPC used for cluster nodes."
  value       = try(module.required_infra[0].vpc, null)
}

output "key_pair" {
  description = "The key pair created for use with pcluster."
  value       = try(module.required_infra[0].key_pair, null)
}

output "private_key" {
  description = "The private key used to create the key pair for use with pcluster."
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
