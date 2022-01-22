variable "bucket_name" {
  description = "Bucket name"
  type        = string
  default     = ""
}

variable "forwarder_arn" {
  description = "Forwarder arn"
  type        = string
  default     = ""
}

variable "bucket_events" {
  description = "Bucket events"
  type        = list(any)
  default     = []
}

variable "bucket_filter_prefix" {
  description = "Bucket filter prefix"
  type        = string
  default     = ""
}

variable "bucket_filter_suffix" {
  description = "Bucket filter suffix"
  type        = string
  default     = ""
}
