/**
 *  # Clusters Submodule
 *  This module takes in a list of clusters as a terraform object. Cluster lists can be from
 *  json, yaml, or terraform objects. Each cluster containes the name and configuration.
 *  Optionally region, rollback, and validation settings may be specified.
 */

locals {
  config_file = yamldecode(try(templatefile(var.config_path, var.template_vars), "{}"))

  cluster_file_configs = {
    for k, v in local.config_file : k => merge(v, {
      configuration : try(templatefile(v.configuration, var.template_vars), yamlencode(v.configuration))
    })
  }

  cluster_configs = {
    for k, v in var.cluster_configs : k => merge(v, {
      configuration : try(templatefile(v.configuration, var.template_vars), yamlencode(v.configuration))
    })
  }
}

resource "pcluster_cluster" "managed_file_configs" {
  for_each = local.cluster_file_configs

  cluster_name             = each.key
  cluster_configuration    = tostring(each.value.configuration)
  region                   = try(each.value.region, null)
  rollback_on_failure      = try(each.value.rollbackOnFailure, null)
  suppress_validators      = try(each.value.suppressValidators, null)
  validation_failure_level = try(each.value.validationFailureLevel, null)
}

resource "pcluster_cluster" "managed_configs" {
  for_each = local.cluster_configs

  cluster_name             = each.key
  cluster_configuration    = each.value.configuration
  region                   = try(each.value.region, null)
  rollback_on_failure      = try(each.value.rollbackOnFailure, null)
  suppress_validators      = try(each.value.suppressValidators, null)
  validation_failure_level = try(each.value.validationFailureLevel, null)
}
