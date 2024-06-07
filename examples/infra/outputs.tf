output "vpc_id" {
  description = "The VPC used for cluster nodes."
  value       = module.required_infra.vpc.id
}

output "key_pair_id" {
  description = "The key pair created for use with pcluster."
  value       = module.required_infra.key_pair.id
}

output "private_key_id" {
  description = "The private key used to create the key pair for use with pcluster."
  sensitive   = true
  value       = module.required_infra.private_key.id
}

output "public_subnets_ids" {
  description = "Private subnets."
  value       = [for subnet in module.required_infra.public_subnets : subnet.id]
}

output "private_subnets_ids" {
  description = "Public subnets."
  value       = [for subnet in module.required_infra.private_subnets : subnet.id]
}
