# AWS ParallelCluster Module for Terraform
The Terraform module to deploy High Performance Computing (HPC) clusters on AWS with [AWS ParallelCluster](https://aws.amazon.com/hpc/parallelcluster/).

## Issues

Please open a GitHub issue for any feedback or issues: https://github.com/aws/aws-parallelcluster/issues.
There is also an active AWS HPC forum which may be helpful: https://repost.aws/tags/TAbl-DsTlyQMe0T2i-d5Rr8g/aws-parallel-cluster.

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This project is licensed under the Apache-2.0 License.

<!-- BEGIN_TF_DOCS -->
 Copyright 2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License"). You may not
 use this file except in compliance with the License. A copy of the License is
 located at

 http://aws.amazon.com/apache2.0/

 or in the "LICENSE.txt" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
 implied. See the License for the specific language governing permissions and
 limitations under the License.

 # ParallelCluster Management Module

 This ParallelCluster Management Module can be used to deploy the ParallelCluster API,
 necessary infrastructure for clusters, and manage a list of clusters. Each of of these
 is handled by a submodule that can be used individually.

 ##### Doc Generation
 Documentation is generated with terraform-docs. The config file is stored at
 `.config/.terraform-docs.yml`. See: https://github.com/terraform-docs/terraform-docs.
 Run `terraform-docs markdown ./` from the root of the repository to regenerate the README
 files.

 #### API Submodule
 The ParallelCluster API submodule deploys an Amazon API Gateway endpoint, IAM roles and
 policies, and an AWS Lambda function, that takes care of processing the invoked features.
 Deployed using a ParallelCluster API Cloudformation Template.

 #### Required Infrastructure Submodule
 The required infra submodule deploys a vpc, subnets, routes, gateways, and creates a key
 pair. These are necessary resources for the API to deploy and manage clusters.

 #### Clusters Submodule
 This module takes in a list of clusters as a terraform object. Cluster lists can be from
 json, yaml, or terraform objects. Each cluster contains the name and configuration.
 Optionally region, rollback, and validation settings may be specified.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5.7 |
| <a name="requirement_aws-parallelcluster"></a> [aws-parallelcluster](#requirement\_aws-parallelcluster) | ~> 1.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_clusters"></a> [clusters](#module\_clusters) | ./modules/clusters | n/a |
| <a name="module_pcluster_api"></a> [pcluster\_api](#module\_pcluster\_api) | ./modules/pcluster_api | n/a |
| <a name="module_required_infra"></a> [required\_infra](#module\_required\_infra) | ./modules/required_infra | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_version"></a> [api\_version](#input\_api\_version) | Version of ParallelCluster API to deploy. | `string` | n/a | yes |
| <a name="input_api_stack_name"></a> [api\_stack\_name](#input\_api\_stack\_name) | Name of the ParallelCluster API CloudFormation stack. | `string` | `"ParallelCluster"` | no |
| <a name="input_cluster_configs"></a> [cluster\_configs](#input\_cluster\_configs) | An object containing a list of clusters to deploy. | `any` | `{}` | no |
| <a name="input_config_path"></a> [config\_path](#input\_config\_path) | A path to a json or yaml file containing cluster configurations | `string` | `""` | no |
| <a name="input_custom_pcluster_template_uri"></a> [custom\_pcluster\_template\_uri](#input\_custom\_pcluster\_template\_uri) | Custom CloudFormation ParallelCluster template URI. | `string` | `""` | no |
| <a name="input_deploy_pcluster_api"></a> [deploy\_pcluster\_api](#input\_deploy\_pcluster\_api) | If set to true deploys the ParallelCluster API CloudFormation template. | `string` | `false` | no |
| <a name="input_deploy_required_infra"></a> [deploy\_required\_infra](#input\_deploy\_required\_infra) | If set to true deploys infrastructure required for clusters. | `bool` | `false` | no |
| <a name="input_json_configs"></a> [json\_configs](#input\_json\_configs) | An object containing a list of clusters to deploy. | `string` | `"{}"` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Map of parameters to pass to the ParallelCluster API CloudFormation template. Refer to the ParallelCluster documentation to see available parameters. | `map(any)` | `{}` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | String to prefix to resource names. | `string` | `"pcluster"` | no |
| <a name="input_private_subnet_az"></a> [private\_subnet\_az](#input\_private\_subnet\_az) | The availability zone to create the private subnets in. | `string` | `"us-east-1a"` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of cidr blocks to be used for private subnets. Has to be in the vpc cidr block. Cannot conflict with public subnets. | `list(any)` | <pre>[<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_az"></a> [public\_subnet\_az](#input\_public\_subnet\_az) | The availability zone to create the public subnets in. | `string` | `"us-east-1a"` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of cidr blocks to be used for public subnets. Has to be in the vpc cidr block. Cannot conflict with private subnets. | `list(any)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy the ParallelCluster API CloudFormation templates. | `string` | `"us-east-1"` | no |
| <a name="input_template_vars"></a> [template\_vars](#input\_template\_vars) | If a cluster configuration is passed as a template file use these vars for interpolation. | `map(any)` | `{}` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The cidr block of the vpc the cluster nodes will be created in. The public and private subnet cidr blocks should fall within this block. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_yaml_configs"></a> [yaml\_configs](#input\_yaml\_configs) | An object containing a list of clusters to deploy. | `string` | `"{}"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clusters"></a> [clusters](#output\_clusters) | The ParallelCluster clusters. |
| <a name="output_key_pair"></a> [key\_pair](#output\_key\_pair) | The key pair created for use with AWS ParallelCluster. |
| <a name="output_pcluster_api_stack_name"></a> [pcluster\_api\_stack\_name](#output\_pcluster\_api\_stack\_name) | The ParallelCluster API Cloudformation Stack name. |
| <a name="output_pcluster_api_stack_outputs"></a> [pcluster\_api\_stack\_outputs](#output\_pcluster\_api\_stack\_outputs) | The ParallelCluster API Cloudformation Stack outputs. |
| <a name="output_pcluster_api_stack_parameters"></a> [pcluster\_api\_stack\_parameters](#output\_pcluster\_api\_stack\_parameters) | The ParallelCluster API Cloudformation Stack parameters. |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | The private key used to create the key pair for use with the cluster. |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Public subnets. |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Private subnets. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The VPC used for cluster nodes. |
<!-- END_TF_DOCS -->
