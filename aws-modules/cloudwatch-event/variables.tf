variable "is_enabled" {
  description = " (Optional) Whether the rule should be enabled (defaults to true)"
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

variable "use_null_label" {
  type    = bool
  default = false
}

variable "name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) The description of the rule"
  type        = string
  default     = null
}

variable "event_role_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) associated with the role that is used for target invocation"
  type        = string
  default     = null
}

variable "event_target_role_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) associated with the role that is used for target invocation"
  type        = string
  default     = null
}

variable "schedule_expression" {
  description = "(Optional) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes)"
  type        = string
  default     = null
}

variable "event_bus_name" {
  description = "(Optional) The event bus to associate with this rule. If you omit this, the default event bus is used"
  type        = string
  default     = null
}

variable "event_pattern" {
  description = "(Optional) The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required"
  type        = string
  default     = null
}
