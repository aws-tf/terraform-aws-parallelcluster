output "vpc" {
  description = "The VPC used for cluster nodes."
  value       = aws_vpc.vpc
}

output "key_pair" {
  description = "The key pair created for use with pcluster."
  value       = aws_key_pair.key_pair
}

output "private_key" {
  description = "The private key used to create the key pair for use with pcluster."
  value       = tls_private_key.key
}

output "public_subnets" {
  description = "Private subnets."
  value       = aws_subnet.public
}

output "private_subnets" {
  description = "Public subnets."
  value       = aws_subnet.private
}
