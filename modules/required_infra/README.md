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

 # Required Infrastructure Submodule
 The required infra submodule deploys a vpc, subnets, routes, gateways, and creates a
 key pair. These are necessary resources for the API to deploy and manage clusters.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.34.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_default_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | resource |
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.internet-gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [tls_private_key.key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | String to prefix to resource names. | `string` | `"pcluster"` | no |
| <a name="input_private_subnet_az"></a> [private\_subnet\_az](#input\_private\_subnet\_az) | The az to create the private subnets in. | `string` | `"us-east-1a"` | no |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of cidr blocks to be used for private subnets. Has to be in the vpc cidr block. Cannot conflict with public subnets. | `list(any)` | <pre>[<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_az"></a> [public\_subnet\_az](#input\_public\_subnet\_az) | The az to create the public subnets in. | `string` | `"us-east-1a"` | no |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of cidr blocks to be used for public subnets. Has to be in the vpc cidr block. Cannot conflict with private subnets. | `list(any)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The cidr block of the vpc the cluster nodes will be created in. The public and private subnet cidr blocks should fall within this block. | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_pair"></a> [key\_pair](#output\_key\_pair) | The key pair created for use with pcluster. |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | The private key used to create the key pair for use with pcluster. |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | Public subnets. |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | Private subnets. |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | The VPC used for cluster nodes. |
<!-- END_TF_DOCS -->