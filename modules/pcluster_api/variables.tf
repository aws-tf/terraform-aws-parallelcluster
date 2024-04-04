variable "region" {
  type        = string
  description = "Region to deploy the ParallelCluster API Cloudformation templates."
  default     = "us-east-1"
}

variable "api_stack_name" {
  type        = string
  description = "Name of the CloudFormation stack."
  default     = "ParallelCluster"
}

variable "api_version" {
  type        = string
  description = "Version of ParallelCluster to deploy."
  default     = "3.9.0"
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
