### Module variables

variable "enabled" {
  description = "A boolean to enable/disable resource creation"
  type        = bool
  default     = true
}

variable "cloudflare_token" {
  description = "CloudFlare token"
  type        = string
  default     = ""
}

variable "ssm_cloudflare_token" {
  description = "CloudFlare token from parameter store"
  type        = string
  default     = "/Cloudflare/token"
}

variable "cloudflare_zone_id" {
  description = "Domain into which re record will be added"
  type        = string
  default     = ""
}

variable "record_subdomain" {
  description = "The name of the record"
  type        = string
  default     = ""
}

variable "record_priority" {
  description = "The priority of the record"
  type        = number
  default     = null
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
  description = "The TTL of the record. Must be set to 1 for proxied to work"
  type        = string
  default     = "1"
}

variable "proxied" {
  description = "Whether the record gets Cloudflare's origin protection"
  type        = bool
  default     = true
}

# Page redirection rule
variable "page_rule" {
  description = "Setup page rule. For details see: https://www.terraform.io/docs/providers/cloudflare/r/page_rule.html"
  type        = any
  default     = []
}
