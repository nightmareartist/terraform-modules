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

variable "destination" {
  description = "(Required) This is the destination to where the data is delivered. The only options are s3 (Deprecated, use extended_s3 instead), extended_s3, redshift, elasticsearch, splunk, and http_endpoint."
  type        = string
  default     = ""
}

variable "ssm_enabled" {
  description = "(Optional) Encrypt at rest options. Server-side encryption should not be enabled when a kinesis stream is configured as the source of the firehose delivery stream."
  type        = bool
  default     = false
}

variable "key_type" {
  description = "(Optional) Type of encryption key. Default is AWS_OWNED_CMK. Valid values are AWS_OWNED_CMK and CUSTOMER_MANAGED_CMK."
  type        = string
  default     = "AWS_OWNED_CMK"
}

variable "key_arn" {
  description = "(Optional) Amazon Resource Name (ARN) of the encryption key. Required when key_type is CUSTOMER_MANAGED_CMK."
  type        = string
  default     = ""
}

variable "role_arn" {
  description = "(Required) The ARN of the AWS credentials."
  type        = string
  default     = ""
}

variable "bucket_arn" {
  description = "(Required) The ARN of the S3 bucket."
  type        = string
  default     = ""
}

variable "s3_backup_mode" {
  description = "(Optional) The Amazon S3 backup mode. Valid values are Disabled and Enabled. Default value is Disabled."
  type        = string
  default     = "Disabled"
}

variable "buffer_interval" {
  description = "(Optional) Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300."
  type        = number
  default     = 300
}

variable "buffer_size" {
  description = "(Optional) Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. We recommend setting SizeInMBs to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec set SizeInMBs to be 10 MB or higher."
  type        = number
  default     = 5
}

variable "compression_format" {
  description = "(Optional) The compression format. If no value is specified, the default is UNCOMPRESSED. Other supported values are GZIP, ZIP & Snappy. If the destination is redshift you cannot use ZIP or Snappy."
  type        = string
  default     = "UNCOMPRESSED"
}

variable "cloudwatch_logging_enabled" {
  description = "(Optional) Enables or disables the logging. Defaults to false."
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "(Optional) The CloudWatch group name for logging. This value is required if enabled is true."
  type        = string
  default     = ""
}

variable "log_stream_name" {
  description = "(Optional) The CloudWatch log stream name for logging. This value is required if enabled is true."
  type        = string
  default     = ""
}

variable "s3_kms_key_arn" {
  description = "(Optional) Specifies the KMS key ARN the stream will use to encrypt data. If not set, no encryption will be used."
  type        = string
  default     = ""
}
