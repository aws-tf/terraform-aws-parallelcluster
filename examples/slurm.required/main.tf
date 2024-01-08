

module "pcluster" {
  source = "../../."

  parameters = {
    EnableIamAdminAccess = "true"
  }

  deploy_pcluster_api = true
  api_version         = "3.8.0"

  deploy_required_infra = true

  region          = "us-east-1"
  template_vars   = local.config_vars
  cluster_configs = local.cluster_configs
  config_path     = "files/pcluster-example-config.yaml"
}
