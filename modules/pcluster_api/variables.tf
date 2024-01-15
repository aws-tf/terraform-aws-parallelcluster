variable "region" {
  type        = string
  description = "Region to deploy the ParallelCluster API Cloudformation templates."
  default     = "us-east-1"
}

variable "name" {
  type        = string
  description = "Name of the cloudformation stack."
  default     = "ParallelCluster"
}

variable "api_version" {
  type        = string
  description = "Version of ParallelCluster to deploy."
  default     = "3.8.0"
}

variable "custom_pcluster_template_uri" {
  type        = string
  description = "Custom cloudformation ParallelCluster template URI."
  default     = ""
}

variable "parameters" {
  type        = map(any)
  description = "Map of parameters to pass to the ParallelCluster cloudformation template. Refer to the ParallelCluster documentation to see available parameters."
  default     = {}
}
