variable "trusted_role_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "external_id" {
  description = "External ID that can assume this role"
  type        = string
  default     = ""
}

variable "create_role" {
  description = "Whether to create a role"
  type        = bool
  default     = false
}

variable "role_name" {
  description = "The name of the role. It will forces new resource on change."
  type        = string
}

variable "role_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "role_description" {
  description = "The description of the role."
  type        = string
}

variable "role_permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = ""
}

variable "role_force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  default     = false
}

variable "role_max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
  default     = 3600
}

variable "tags" {
  description = "Default tags."
  type        = map(string)
  default     = {}
}

variable "custom_role_policy_arns" {
  description = "List of ARNs of IAM policies to attach to IAM role"
  type        = list(string)
  default     = []
}
