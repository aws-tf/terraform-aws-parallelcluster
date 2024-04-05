terraform {
  backend "s3" {
    # The 'bucket' attribute has been intentionally omitted so that 'terraform init' will prompt the user to specify it.
    # bucket = "INSERT_HERE_YOUR_BUCKET_NAME"
    key    = "terraform-aws-parallelcluster/examples/required_infra/terraform.tfstate"
    region = "us-east-1"
  }
}
