### Common variables
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

variable "region" {
  description = "region"
  type        = string
  default     = "eu-west-1"
}

variable "api_url" {
  description = "Datadog API url"
  type        = string
  default     = ""
}

variable "account_id" {
  description = "AWS Account ID without dashes"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "Datadog role delegation name"
  type        = string
  default     = ""
}

variable "filter_tags" {
  description = "Array of EC2 tags to use as filter"
  type        = list(string)
  default     = []
}

variable "host_tags" {
  description = "Array of tags (in the form key:value) to add to all hosts and metrics generated"
  type        = list(string)
  default     = []
}

variable "excluded_regions" {
  description = "Αrray of AWS regions to exclude from metrics collection"
  type        = list(string)
  default     = []
}
