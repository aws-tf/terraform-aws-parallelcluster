module "api" {
  source = "../../modules/pcluster_api"

  api_version = "3.8.0"
  parameters = {
    EnableIamAdminAccess = "true"
  }
}
