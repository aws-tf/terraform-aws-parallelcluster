
terraform {
  required_providers {
    pcluster = {
      source  = "hashicorp/terraform-provider-aws-parallelcluster"
      version = "~> 3.9.0"
    }
  }
}
