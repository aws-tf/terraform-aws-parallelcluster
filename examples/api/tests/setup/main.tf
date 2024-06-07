resource "random_uuid" "test" {}

output "api_version" {
  value = "3.9.1"
}

output "api_stack_name" {
  value = "ParallelCluster-${random_uuid.test.result}"
}
