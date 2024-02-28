/**
 *  Copyright 2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"). You may not
 *  use this file except in compliance with the License. A copy of the License is
 *  located at
 *
 *  http://aws.amazon.com/apache2.0/
 *
 *  or in the "LICENSE.txt" file accompanying this file. This file is distributed
 *  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
 *  implied. See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *  # ParallelCluster Management Module
 *
 *  This ParallelCluster Management Module can be used to deploy the ParallelCluster API,
 *  necessary infrastructure for clusters, and manage a list of clusters. Each of of these
 *  is handled by a submodule that can be used individually.
 *
 *  ##### Doc Generation
 *  Documentation is generated with terraform-docs. The config file is stored at
 *  `.config/.terraform-docs.yml`. See: https://github.com/terraform-docs/terraform-docs.
 *  Run `terraform-docs markdown ./` from the root of the repository to regenerate the README
 *  files.
 *
 *  #### API Submodule
 *  The ParallelCluster API submodule deploys an Amazon API Gateway endpoint, IAM roles and
 *  policies, and an AWS Lambda function, that takes care of processing the invoked features.
 *  Deployed using a ParallelCluster API Cloudformation Template.
 *
 *  #### Required Infrastructure Submodule
 *  The required infra submodule deploys a vpc, subnets, routes, gateways, and creates a key
 *  pair. These are necessary resources for the API to deploy and manage clusters.
 *
 *  #### Clusters Submodule
 *  This module takes in a list of clusters as a terraform object. Cluster lists can be from
 *  json, yaml, or terraform objects. Each cluster contains the name and configuration.
 *  Optionally region, rollback, and validation settings may be specified.
 */

module "required_infra" {
  count  = var.deploy_required_infra ? 1 : 0
  source = "./modules/required_infra"

  prefix               = var.prefix
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_az     = var.public_subnet_az
  private_subnet_az    = var.private_subnet_az
}

module "pcluster_api" {
  count  = var.deploy_pcluster_api ? 1 : 0
  source = "./modules/pcluster_api"

  region                       = var.region
  api_stack_name               = var.name
  api_version                  = var.api_version
  custom_pcluster_template_uri = var.custom_pcluster_template_uri
  parameters                   = var.parameters
}

module "clusters" {
  count  = (length(var.cluster_configs) > 0) || (var.config_path != "") ? 1 : 0
  source = "./modules/clusters"

  template_vars   = var.template_vars
  yaml_configs    = var.yaml_configs
  json_configs    = var.json_configs
  cluster_configs = var.cluster_configs
  config_path     = var.config_path

  depends_on = [module.pcluster_api]
}
