### Common variables
variable "api_url" {
  description = "Datadog API url"
  type        = string
  default     = ""
}

variable "api_key_ssm_name" {
  description = "Name of ssm param that holds the Datadog API key"
  type        = string
  default     = ""
}

variable "app_key_ssm_name" {
  description = "Name of ssm param that holds the Datadog APP key"
  type        = string
  default     = ""
}

variable "name" {
  description = "Archive name"
  type        = string
  default     = ""
}

variable "query" {
  description = "The archive query/filter. Logs matching this query are included in the archive."
  type        = string
  default     = ""
}

variable "bucket" {
  description = "Name of s3 bucket."
  type        = string
  default     = ""
}

variable "path" {
  description = "Path under the s3 bucket where the archive will be stored."
  type        = string
  default     = ""
}

variable "account_id" {
  description = "AWS account id."
  type        = string
  default     = ""
}

variable "role_name" {
  description = "AWS role name that is used."
  type        = string
  default     = ""
}

variable "include_tags" {
  description = "Store the tags in the archive or not."
  type        = string
  default     = ""
}
