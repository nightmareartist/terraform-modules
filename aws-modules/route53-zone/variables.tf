variable "enabled" {
  description = "Set to false to prevent the module from creating or accessing any resources"
  type        = bool
  default     = true
}

variable "namespace" {
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "environment" {
  description = "environment, which could be your organization name, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "name" {
  description = "Service name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "domain" {
  description = "Top level domain"
  type        = string
  default     = ""
}
variable "vpc" {
  description = "Primary VPC ID that will be associated with this hosted zone"
  type        = list(map(string))
  default     = []
}

variable "secondary_vpcs" {
  description = "List of VPCs that will also be associated with this zone"
  type        = list(string)
  default     = []
}

variable "force_destroy" {
  description = "Whether to destroy all records inside if the hosted zone is deleted"
  type        = string
  default     = false
}
