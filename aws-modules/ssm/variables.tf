variable "name" {
  description = "(Required) The name of the parameter. If the name contains a path (e.g. any forward slashes (/)), it must be fully qualified with a leading forward slash (/). For additional requirements and constraints, see: https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html"
  type        = string
  default     = ""
}

variable "description" {
  description = "(Optional) The description of the parameter"
  type        = string
  default     = ""
}

variable "type" {
  description = "(Required) The type of the parameter. Valid types are String, StringList and SecureString"
  type        = string
  default     = "SecureString"
}

variable "value" {
  description = "(Required) The value of the parameter"
  type        = string
  default     = ""
}

variable "tier" {
  description = "(Optional) The tier of the parameter. If not specified, will default to Standard. Valid tiers are Standard and Advanced. For more information on parameter tiers, see https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html"
  type        = string
  default     = "Standard"
}

variable "key_id" {
  description = "(Optional) The KMS key id or arn for encrypting a SecureString. Default KMS SSM will be used if this is empty"
  type        = string
  default     = ""
}

variable "overwrite" {
  description = "(Optional) Overwrite an existing parameter. If not specified, will default to false if the resource has not been created by terraform to avoid overwrite of existing resource and will default to true otherwise (terraform lifecycle rules should then be used to manage the update behavior)"
  type        = bool
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the object"
  default     = {}
}
