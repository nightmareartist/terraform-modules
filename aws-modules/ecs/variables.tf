variable "enabled" {
  description = "Controls if ECS should be created"
  type        = bool
  default     = true
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}


variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "create_capacity_provider" {
  description = "Enable usage of capacity provider"
  type        = bool
  default     = false
}

variable "capacity_provider_base" {
  description = "(Optional) The number of tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined."
  type        = number
  default     = 0
}

variable "capacity_provider_weight" {
  description = "(Optional) The relative percentage of the total number of launched tasks that should use the specified capacity provider. "
  type        = number
  default     = 100
}

variable "auto_scaling_group_arn" {
  description = "Autoscaling group ARN"
  type        = string
  default     = ""
}

variable "managed_termination_protection" {
  description = "Enables or disables container-aware termination of instances in the auto scaling group when scale-in happens. Valid values are ENABLED and DISABLED"
  type        = string
  default     = "ENABLED"
}

variable "maximum_scaling_step_size" {
  description = "The maximum step adjustment size. A number between 1 and 10,000"
  type        = number
  default     = 10
}

variable "minimum_scaling_step_size" {
  description = "The minimum step adjustment size. A number between 1 and 10,000"
  type        = number
  default     = 1
}

variable "managed_scaling_status" {
  description = "Whether auto scaling is managed by ECS. Valid values are ENABLED and DISABLED"
  type        = string
  default     = "ENABLED"
}

variable "target_capacity" {
  description = "The target utilization for the capacity provider. A number between 1 and 100"
  type        = number
  default     = 100
}

variable "setting_value" {
  description = "The value to assign to the setting. Value values are enabled and disabled"
  type        = string
  default     = "disabled"
}
