variable "region" {
  type        = string
  description = "The region to deploy the ParallelCluster API."
  default     = "us-east-1"
}

variable "api_stack_name" {
  type        = string
  description = "The name of the CloudFormation stack use to deploy the ParallelCluster API."
  default     = "ParallelCluster"
}

variable "api_version" {
  type        = string
  description = "The version of the ParallelCluster API to deploy."
}

variable "custom_pcluster_template_uri" {
  type        = string
  description = "The URI of a custom CloudFormation template to deploy ParallelCluster API."
  default     = ""
}

variable "parameters" {
  type        = map(any)
  description = "The map of parameters to pass to the ParallelCluster CloudFormation template. Refer to the ParallelCluster documentation to see available parameters."
  default     = {}
}
