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

variable "enable_log_file_validation" {
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
  type        = bool
  default     = true
}

variable "is_multi_region_trail" {
  description = "Specifies whether the trail is created in the current region or in all regions"
  type        = bool
  default     = false
}

variable "include_global_service_events" {
  description = "Specifies whether the trail is publishing events from global services such as IAM to the log files"
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "Enable logging for the trail"
  type        = bool
  default     = true
}

variable "s3_bucket_name" {
  description = "S3 bucket name for CloudTrail logs"
  type        = string
}

variable "s3_key_prefix" {
  description = "Specifies the S3 key prefix that follows the name of the bucket you have designated for log file delivery"
  type        = string
}

variable "cloud_watch_logs_role_arn" {
  description = "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group"
  type        = string
  default     = ""
}

variable "cloud_watch_logs_group_arn" {
  description = "Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered"
  type        = string
  default     = ""
}

variable "event_selector" {
  description = "Specifies an event selector for enabling data event logging. See: https://www.terraform.io/docs/providers/aws/r/cloudtrail.html for details on this variable"
  type = list(object({
    include_management_events = bool
    read_write_type           = string

    data_resource = list(object({
      type   = string
      values = list(string)
    }))
  }))
  default = []
}

variable "kms_key_arn" {
  description = "Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail"
  type        = string
  default     = ""
}

variable "is_organization_trail" {
  description = "The trail is an AWS Organizations trail"
  type        = bool
  default     = false
}
