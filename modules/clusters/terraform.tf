
terraform {
  required_version = ">=1.5.7"

  required_providers {
    aws-parallelcluster = {
      source  = "aws-tf/aws-parallelcluster"
      version = "1.0.0-alpha"
    }
  }
}
