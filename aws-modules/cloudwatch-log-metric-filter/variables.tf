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

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "metric_name" {
  description = "Custom name for the metric"
  type        = string
  default     = ""
}

variable "log_group_name" {
  description = "Log group to use for this filter"
  type        = string
}

variable "pattern" {
  description = "Pattern used for filtering"
  type        = list(string)
  default     = []
}

variable "metric_transformation_name" {
  description = "The name of the CloudWatch metric to which the monitored log information should be published (e.g. ErrorCount)"
  type        = list(string)
  default     = []
}

variable "metric_transformation_namespace" {
  description = "The destination namespace of the CloudWatch metric"
  type        = string
  default     = ""
}

variable "metric_transformation_value" {
  description = "What to publish to the metric. For example, if you're counting the occurrences of a particular term like Error, the value will be 1 for each occurrence. If you're counting the bytes transferred the published value will be the value in the log event"
  type        = string
}

variable "metric_transformation_default_value" {
  description = "The value to emit when a filter pattern does not match a log event"
  type        = string
  default     = ""
}
