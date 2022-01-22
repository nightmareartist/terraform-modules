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

variable "bucket" {
  description = "(Required) The name of the bucket to read the object from. Alternatively, an S3 access point ARN can be specified"
  type        = string
  default     = null
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'. See: https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl for options"
  type        = string
  default     = "private"
}

variable "key" {
  description = "(Required) The full path to the object inside the bucket"
  type        = string
  default     = ""
}

variable "etag" {
  description = "(Optional) ETag generated for the object (an MD5 sum of the object content in case it's not encrypted)"
  type        = string
  default     = null
}

variable "object_source" {
  description = " (Required unless content or content_base64 is set) The path to a file that will be read and uploaded as raw bytes for the object content"
  type        = string
  default     = ""
}

variable "kms_key_id" {
  description = "(Optional) The KMS key id or arn for encrypting a SecureString. Default KMS SSM will be used if this is empty"
  type        = string
  default     = null
}

variable "object_lock_legal_hold_status" {
  description = "(Optional) The legal hold status that you want to apply to the specified object"
  type        = string
  default     = null
}
