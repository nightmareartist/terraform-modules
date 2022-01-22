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

variable "shard_count" {
  description = "(Required) The number of shards that the stream will use. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream. See: https://docs.aws.amazon.com/kinesis/latest/dev/amazon-kinesis-streams.html"
  type        = number
  default     = 1
}

variable "retention_period" {
  description = "(Optional) Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24."
  type        = number
  default     = 24
}

variable "shard_level_metrics" {
  description = "(Optional) A list of shard-level CloudWatch metrics which can be enabled for the stream. See https://docs.aws.amazon.com/streams/latest/dev/monitoring-with-cloudwatch.html for more. Note that the value ALL should not be used; instead you should provide an explicit list of metrics you wish to enable."
  type        = list(string)
  default     = []
}

variable "enforce_consumer_deletion" {
  description = "(Optional) A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error. The default value is false."
  type        = bool
  default     = false
}

variable "encryption_type" {
  description = "(Optional) The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE."
  type        = string
  default     = "NONE"
}

variable "kms_key_id" {
  description = "(Optional) The GUID for the customer-managed KMS key to use for encryption. You can also use a Kinesis-owned master key by specifying the alias alias/aws/kinesis."
  type        = string
  default     = ""
}




