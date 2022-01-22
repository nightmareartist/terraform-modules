### Common variables
variable "namespace" {
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "environment" {
  description = "environment, which could be your organization name, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "name" {
  description = "Service name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default tags."
  type        = map(string)
  default     = {}
}

### Module variables
variable "enabled" {
  description = "A boolean to enable/disable resource creation"
  type        = bool
  default     = true
}

variable "dnsimple_token" {
  description = "The TTL of the record"
  type        = string
  default     = ""
}

variable "dnsimple_account" {
  description = "The ID of the account associated with the token"
  type        = string
  default     = ""
}

variable "dnsimple_domain" {
  description = "Domain into which re record will be added"
  type        = string
  default     = ""
}

variable "ssm_dnsimple_token" {
  description = "The DNSimple API v2 token. It must be provided, but it can also be sourced from the DNSIMPLE_TOKEN environment variable"
  type        = string
  default     = "/DNSimple/token"
}

variable "record_subdomain" {
  description = "The name of the record"
  type        = string
  default     = ""
}

variable "record_priority" {
  description = "The priority of the record"
  type        = string
  default     = ""
}

variable "record_value" {
  description = "The value of the record"
  type        = string
  default     = ""
}

variable "record_type" {
  description = "The type of the record"
  type        = string
  default     = ""
}

variable "record_ttl" {
  description = "The TTL of the record"
  type        = string
  default     = "3600"
}
