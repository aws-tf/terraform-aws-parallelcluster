/**
 *  # ParallelCluster Managment Module
 *
 *  This ParallelCluster Managment Module can be used to deploy the ParallelCluster API,
 *  necessary infrastructure for clusters, and manage a list of clusters. Each of of these
 *  is handled by a submodule that can be used individually.
 *
 *  ##### Doc Generation
 *  Documnentation is generated with terraform-docs. The config file is stored at
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
 *  json, yaml, or terraform objects. Each cluster containes the name and configuration.
 *  Optionally region, rollback, and validation settings may be specified.
 */

module "required_infra" {
  count  = var.deploy_required_infra ? 1 : 0
  source = "./modules/required_infra"

  prefix               = var.prefix
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "pcluster_api" {
  count  = var.deploy_pcluster_api ? 1 : 0
  source = "./modules/pcluster_api"

  region                       = var.region
  name                         = var.name
  api_version                  = var.api_version
  custom_pcluster_template_uri = var.custom_pcluster_template_uri
  parameters                   = var.parameters
}

module "clusters" {
  count  = length(var.cluster_configs) > 0 ? 1 : 0
  source = "./modules/clusters"

  template_vars   = var.template_vars
  yaml_configs    = var.yaml_configs
  json_configs    = var.json_configs
  cluster_configs = var.cluster_configs
  config_path     = var.config_path

  depends_on = [module.pcluster_api]
}
