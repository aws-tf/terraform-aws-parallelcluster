<!-- BEGIN_TF_DOCS -->
 # Clusters Submodule
 This module takes in a list of clusters as a terraform object. Cluster lists can be from
 json, yaml, or terraform objects. Each cluster containes the name and configuration.
 Optionally region, rollback, and validation settings may be specified.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5.7 |
| <a name="requirement_aws-parallelcluster"></a> [aws-parallelcluster](#requirement\_aws-parallelcluster) | ~> 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws-parallelcluster"></a> [aws-parallelcluster](#provider\_aws-parallelcluster) | ~> 1.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| aws-parallelcluster_cluster.managed_configs | resource |
| aws-parallelcluster_cluster.managed_file_configs | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_configs"></a> [cluster\_configs](#input\_cluster\_configs) | An object containing a list of clusters to deploy. | `any` | `{}` | no |
| <a name="input_config_path"></a> [config\_path](#input\_config\_path) | A path to a json or yaml file containing cluster configurations | `string` | `""` | no |
| <a name="input_json_configs"></a> [json\_configs](#input\_json\_configs) | An object containing a list of clusters to deploy. | `string` | `"{}"` | no |
| <a name="input_template_vars"></a> [template\_vars](#input\_template\_vars) | If a cluster configuration is passed as a template file use these vars for interpolation. | `map(any)` | `{}` | no |
| <a name="input_yaml_configs"></a> [yaml\_configs](#input\_yaml\_configs) | An object containing a list of clusters to deploy. | `string` | `"{}"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clusters"></a> [clusters](#output\_clusters) | Description of managed clusters. |
<!-- END_TF_DOCS -->
