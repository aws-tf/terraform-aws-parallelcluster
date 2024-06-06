
terraform {
  required_version = ">=1.5.7"

  required_providers {
    pcluster = {
      source  = "terraform.local/local/pcluster"
      version = "1.0.0-alpha"
    }
  }
}
