resource "random_uuid" "test" {}

output "api_version" {
  value = "3.16.2"
}

output "api_stack_name" {
  value = "ParallelClusterAPI-${random_uuid.test.result}"
}
