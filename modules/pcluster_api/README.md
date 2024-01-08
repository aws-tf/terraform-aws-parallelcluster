<!-- BEGIN_TF_DOCS -->
 # API Submodule
 The ParallelCluster API submodule deploys an Amazon API Gateway endpoint, IAM roles and policies,
 and an AWS Lambda function, that takes care of processing the invoked features.
 Deployed using a ParallelCluster API Cloudformation Template.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | ~> 2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudformation_stack.parallelcluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | Version of ParallelCluster to deploy. | `string` | `"3.8.0"` | no |
| <a name="input_custom_pcluster_template_uri"></a> [custom\_pcluster\_template\_uri](#input\_custom\_pcluster\_template\_uri) | Custom cloudformation ParallelCluster template URI. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the cloudformation stack. | `string` | `"ParallelCluster"` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Map of parameters to pass to the ParallelCluster cloudformation template. Refer to the ParallelCluster documentation to see available parameters. | `map(any)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy the ParallelCluster API Cloudformation templates. | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parallelcluster"></a> [parallelcluster](#output\_parallelcluster) | The ParallelCluster API Cloudformation Stack outputs. Refer to the ParallelCluster documentation to see available outputs. |
<!-- END_TF_DOCS -->