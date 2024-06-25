output "clusters" {
  description = "Description of managed clusters."
  value = merge(
    aws-parallelcluster_cluster.managed_file_configs,
    aws-parallelcluster_cluster.managed_configs
  )
}
