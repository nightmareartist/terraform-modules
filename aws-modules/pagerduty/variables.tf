### Module variables
variable "ssm_pd_endpoint" {
  description = "PagerDuty endpoint in Parameter store"
  type        = string
  default     = ""
}

variable "sns_topic_arn" {
  description = "The ARN of SNS topic to be used"
  type        = string
  default     = ""
}
