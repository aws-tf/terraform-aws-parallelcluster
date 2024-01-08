provider "aws" {
  region  = "us-east-1"
  profile = var.profile
}

provider "pcluster" {
  region   = var.region
  profile  = var.profile
  endpoint = module.pcluster.parallelcluster.ParallelClusterApiInvokeUrl
  role_arn = module.pcluster.parallelcluster.ParallelClusterApiUserRole
}
