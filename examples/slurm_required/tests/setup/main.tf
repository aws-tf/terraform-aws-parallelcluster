output "api_version" {
  value = "3.9.1"
}

output "api_stack_name" {
  value = "ParallelCluster-${formatdate("YYYYMMDD-hhmmss", timestamp())}"
}
