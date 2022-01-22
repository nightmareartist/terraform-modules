variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "metric_alarms" {
  description = "Set of configurations for Cloudwatch alarms"
  type        = any
  default     = {}
}

variable "alarm_actions" {
  description = "Set of configurations for Cloudwatch alarms"
  type        = list(string)
  default     = []
}

variable "alarm_actions_ok" {
  description = "Set of configurations for Cloudwatch alarms"
  type        = list(string)
  default     = []
}
