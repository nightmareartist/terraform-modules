variable "enabled" {
  type        = bool
  default     = true
  description = "Controls if MSK should be created (it affects almost all resources)"
}

variable "name" {
  type        = string
  default     = ""
  description = "Cluster name to be used on all the resources as identifier"
}

variable "vpc_id" {
  type        = string
  description = "VPC where the cluster and workers will be deployed"
}

variable "create_security_group" {
  type        = bool
  default     = true
  description = "Whether to create a security group for the cluster or attach the cluster to `cluster_security_group_id`"
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "A list of the security groups to associate with the elastic network interfaces to control who can communicate with the cluster"
}

variable "enable_key_rotation" {
  type    = bool
  default = true
}

variable "kafka_version" {
  type        = string
  default     = "2.4.1"
  description = "The version of Apache Kafka"
}

variable "number_of_broker_nodes" {
  type        = string
  default     = "3"
  description = "The number of broker nodes in the cluster"
}

variable "enhanced_monitoring" {
  type        = string
  default     = "DEFAULT"
  description = "Specify the desired enhanced MSK CloudWatch monitoring level"
}

variable "instance_type" {
  type        = string
  default     = "kafka.t3.small"
  description = "The type of Amazon EC2 instances to use for Kafka brokers"
}

variable "ebs_volume_size" {
  type        = string
  default     = "1"
  description = "The size in GiB of the EBS volume for the data drive on each broker node"
}

variable "client_subnets" {
  type        = list(string)
  description = "A list of subnets to connect to in client VPC"
}

variable "client_sasl_auth_enabled" {
  type        = bool
  default     = false
  description = "Set `true` to enable the Client SASL Authentication"
}

variable "sasl_scram" {
  type        = bool
  default     = false
  description = "Set `true` to enable the Client SASL SCRAM Authentication"
}

variable "encryption_in_transit_client_broker" {
  type        = string
  default     = "PLAINTEXT"
  description = "Encryption setting for data in transit between clients and brokers"
}

variable "encryption_in_transit_in_cluster" {
  type        = bool
  default     = true
  description = "Whether data communication among broker nodes is encrypted"
}

variable "msk_configuration_arn" {
  type        = string
  default     = ""
  description = "ARN of an existing configuration"
}

variable "msk_configuration_revision" {
  type        = number
  default     = 1
  description = "Revision number of an existing configuration"
}

variable "enable_custom_config" {
  type        = bool
  default     = false
  description = "Control if custom configuration file should be loaded"
}

variable "config_file" {
  type        = string
  default     = "msk.properties"
  description = "Location and name of file with custom configuration"
}

variable "logging_info_cloudwatch_logs_enabled" {
  type        = bool
  default     = false
  description = "Indicates whether you want to enable or disable streaming broker logs to Cloudwatch Logs"
}

variable "logging_info_cloudwatch_logs_log_group" {
  type        = string
  default     = ""
  description = "Name of the Cloudwatch Log Group to deliver logs to"
}

variable "logging_info_cloudwatch_logs_log_group_retention_in_days" {
  type    = string
  default = 90
}

variable "logging_info_firehose_enabled" {
  type        = bool
  default     = false
  description = "Indicates whether you want to enable or disable streaming broker logs to Kinesis Data Firehose"
}

variable "logging_info_firehose_delivery_stream" {
  type        = string
  default     = ""
  description = "Name of the Kinesis Data Firehose delivery stream to deliver logs to"
}

variable "logging_info_s3_enabled" {
  type        = bool
  default     = false
  description = " Indicates whether you want to enable or disable streaming broker logs to S3"
}

variable "logging_info_s3_bucket" {
  type        = string
  default     = ""
  description = "Name of the S3 bucket to deliver logs to"
}

variable "logging_info_s3_prefix" {
  type        = string
  default     = ""
  description = "Prefix to append to the folder name"
}

variable "kms_key_arn" {
  type        = string
  default     = ""
  description = "KMS encryption key id"
}

# ---------------------------------------------------------------------------------------------------------------------
# Tags
# ---------------------------------------------------------------------------------------------------------------------
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to add to MSK Cluster"
}
