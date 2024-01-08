####################
## CLUSTER #########
####################

variable "config_path" {
  type        = string
  description = "A path to a json or yaml file containing cluster configurations"
  default     = ""

  validation {
    condition     = var.config_path == "" || try(fileexists(var.config_path), true)
    error_message = "No file exists at ${var.config_path}."
  }

  validation {
    condition     = can(tostring(var.config_path))
    error_message = "config_path must be a string."
  }
}

variable "yaml_configs" {
  type        = string
  description = "An object containing a list of clusters to deploy."
  default     = "{}"

  validation {
    condition     = alltrue([for k, v in yamldecode(var.yaml_configs) : can(v.configuration)])
    error_message = "Cluster definitions must be valid yaml and each cluster must contain a configuration."
  }
}

variable "json_configs" {
  type        = string
  description = "An object containing a list of clusters to deploy."
  default     = "{}"

  validation {
    condition     = alltrue([for k, v in jsondecode(var.json_configs) : can(v.configuration)])
    error_message = "Cluster definitions must be valid json and each cluster must contain a configuration."
  }
}

variable "template_vars" {
  type        = map(any)
  description = "If a cluster configuration is passed as a template file use these vars for interpolation."
  default     = {}
}

variable "cluster_configs" {
  type        = any
  description = "An object containing a list of clusters to deploy."
  default     = {}

  validation {
    condition = alltrue(
      [
        for k, v in var.cluster_configs :
        can(var.cluster_configs[k].configuration) && var.cluster_configs[k].configuration != null
      ]
    )
    error_message = "All cluster definitions must contain a configuration."
  }
}
