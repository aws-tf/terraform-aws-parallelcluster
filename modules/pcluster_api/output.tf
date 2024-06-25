output "stack_name" {
  description = "The ParallelCluster API Cloudformation Stack name."
  value       = aws_cloudformation_stack.parallelcluster_api.name
}

output "stack_parameters" {
  description = "The ParallelCluster API Cloudformation Stack parameters."
  value       = aws_cloudformation_stack.parallelcluster_api.parameters
}

output "stack_outputs" {
  description = "The ParallelCluster API Cloudformation Stack outputs."
  value       = aws_cloudformation_stack.parallelcluster_api.outputs
}
