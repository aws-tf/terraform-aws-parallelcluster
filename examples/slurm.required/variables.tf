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

variable "endpoint" {
  type        = string
  description = "The endpoint used to deploy parallel clusters."
  default     = null
}

variable "role_arn" {
  type        = string
  description = "The role used to create parallel clusters."
  default     = null
}
