variable "region" {
  description = "The region the API gateway is deployed in."
  type        = string
  default     = null
}

variable "profile" {
  type        = string
  description = "The aws profile used to deploy parallel clusters."
  default     = null
}

## GENERAL ###############

variable "prefix" {
  type        = string
  description = "String to prefix to resource names."
  default     = "pcluster"
}

## VPCs ##################

variable "vpc_cidr_block" {
  type        = string
  description = "The cidr block of the vpc the cluster nodes will be created in. The public and private subnet cidr blocks should fall within this block."
  default     = "10.0.0.0/16"
}

## SUBNETs ###############

variable "public_subnet_cidrs" {
  type        = list(any)
  description = "List of cidr blocks to be used for public subnets. Has to be in the vpc cidr block. Cannot conflict with private subnets."
  default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(any)
  description = "List of cidr blocks to be used for private subnets. Has to be in the vpc cidr block. Cannot conflict with public subnets."
  default     = ["10.0.2.0/24"]
}
