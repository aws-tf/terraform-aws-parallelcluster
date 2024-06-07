/*
 *  Copyright 2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"). You may not
 *  use this file except in compliance with the License. A copy of the License is
 *  located at
 *
 *  http://aws.amazon.com/apache2.0/
 *
 *  or in the "LICENSE.txt" file accompanying this file. This file is distributed
 *  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
 *  implied. See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

####################
## REQUIRED INFRA ##
####################

variable "deploy_required_infra" {
  type        = bool
  description = "If set to true deploys infrastructure required for clusters."
  default     = false
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

variable "public_subnet_az" {
  type        = string
  description = "The availability zone to create the public subnets in."
  default     = "us-east-1a"
}

variable "private_subnet_az" {
  type        = string
  description = "The availability zone to create the private subnets in."
  default     = "us-east-1a"
}

####################
## PCLUSTER API ####
####################
variable "deploy_pcluster_api" {
  type        = string
  description = "If set to true deploys the ParallelCluster API CloudFormation template."
  default     = false
}

variable "region" {
  type        = string
  description = "Region to deploy the ParallelCluster API CloudFormation templates."
  default     = "us-east-1"
}

variable "api_stack_name" {
  type        = string
  description = "Name of the ParallelCluster API CloudFormation stack."
  default     = "ParallelCluster"
}

variable "api_version" {
  type        = string
  description = "Version of ParallelCluster API to deploy."
}

variable "custom_pcluster_template_uri" {
  type        = string
  description = "Custom CloudFormation ParallelCluster template URI."
  default     = ""
}

variable "parameters" {
  type        = map(any)
  description = "Map of parameters to pass to the ParallelCluster API CloudFormation template. Refer to the ParallelCluster documentation to see available parameters."
  default     = {}
}

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
