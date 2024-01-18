output "managed" {
  description = "Description of managed clusters."
  value = merge(
    pcluster_cluster.managed_file_configs,
    pcluster_cluster.managed_configs
  )
}
