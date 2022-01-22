variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "filter_name" {
  description = "Name for the filter"
  type        = string
  default     = ""
}
variable "log_group_name" {
  description = "Log group to use for this filter"
  type        = string
}

variable "destination_arn" {
  description = "The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN."
  type        = string
}

variable "filter_pattern" {
  description = "A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events."
  type        = string
  default     = ""
}
variable "distribution" {
  description = "The method used to distribute log data to the destination (applicable only to kinesis destination). Random or ByLogStream "
  type        = string
  default     = "Random"
}

variable "role_arn" {
  description = "The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination. "
  type        = string
  default     = ""
}
