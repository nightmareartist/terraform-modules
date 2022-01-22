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

variable "retention_in_days" {
  description = "Retention time frame for CloudWatch logs"
  type        = number
  default     = 30
}

variable "s3_bucket" {
  description = "S3 Bucket where logs will be stored"
  type        = string
  default     = ""
}

variable "cloudwatch_logs_exporter_schedule" {
  description = "CloudWatch schedule for export"
  default     = "cron(0 0 * * ? *)"
}
