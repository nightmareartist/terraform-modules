variable "dd_api_key_ssm_name" {
  description = "Datadog API key"
  type        = string
  default     = ""
}

variable "forwarder_name" {
  description = "Forwarder name"
  type        = string
  default     = ""
}

variable "function_name" {
  description = "Function name"
  type        = string
  default     = ""
}

variable "dd_api_url" {
  description = "Datadog API url"
  type        = string
  default     = ""
}

variable "dd_tags" {
  description = "Add custom tags to forwarded logs, comma-delimited string, no trailing comma, e.g., env:prod,stack:classic"
  type        = string
  default     = ""
}

variable "capabilities" {
  description = "Capabilities required when creating the CloudFormation stack"
  type        = list(string)
  default     = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
}
