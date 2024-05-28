terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a"
}

output "subnet_id" {
  value = aws_default_subnet.default_az1.id
}
