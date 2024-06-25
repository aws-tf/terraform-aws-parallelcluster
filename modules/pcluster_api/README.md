<!-- BEGIN_TF_DOCS -->
 # API Submodule
 The ParallelCluster API submodule deploys an Amazon API Gateway endpoint, IAM roles and policies,
 and an AWS Lambda function, that takes care of processing the invoked features.
 Deployed using a ParallelCluster API Cloudformation Template.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5.7 |
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
| [aws_cloudformation_stack.parallelcluster_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudformation_stack) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | The version of the ParallelCluster API to deploy. | `string` | n/a | yes |
| <a name="input_api_stack_name"></a> [api\_stack\_name](#input\_api\_stack\_name) | The name of the CloudFormation stack use to deploy the ParallelCluster API. | `string` | `"ParallelCluster"` | no |
| <a name="input_custom_pcluster_template_uri"></a> [custom\_pcluster\_template\_uri](#input\_custom\_pcluster\_template\_uri) | The URI of a custom CloudFormation template to deploy ParallelCluster API. | `string` | `""` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | The map of parameters to pass to the ParallelCluster CloudFormation template. Refer to the ParallelCluster documentation to see available parameters. | `map(any)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the ParallelCluster API. | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stack_name"></a> [stack\_name](#output\_stack\_name) | The ParallelCluster API Cloudformation Stack name. |
| <a name="output_stack_outputs"></a> [stack\_outputs](#output\_stack\_outputs) | The ParallelCluster API Cloudformation Stack outputs. |
| <a name="output_stack_parameters"></a> [stack\_parameters](#output\_stack\_parameters) | The ParallelCluster API Cloudformation Stack parameters. |
<!-- END_TF_DOCS -->
