variable "region" {
  type        = string
  description = "Region to deploy the ParallelCluster API."
  default     = "us-east-1"
}

variable "api_stack_name" {
  type        = string
  description = "Name of the CloudFormation stack use to deploy the ParallelCluster API."
  default     = "ParallelCluster"
}

variable "api_version" {
  type        = string
  description = "Version of the ParallelCluster API to deploy."
}

variable "custom_pcluster_template_uri" {
  type        = string
  description = "Custom CloudFormation ParallelCluster template URI."
  default     = ""
}

variable "parameters" {
  type        = map(any)
  description = "Map of parameters to pass to the ParallelCluster CloudFormation template. Refer to the ParallelCluster documentation to see available parameters."
  default     = {}
}
