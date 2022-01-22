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

variable "scope" {
  type        = string
  description = "The scope of this Web ACL. Valid options: CLOUDFRONT, REGIONAL."
  default     = "REGIONAL"
}

variable "create_ip_set" {
  description = "Decide whether to create an IP set"
  type        = bool
  default     = false
}

variable "ip_address_version" {
  description = "(Required) Specify IPV4 or IPV6. Valid values are IPV4 or IPV6."
  type        = string
  default     = "IPV4"
}

variable "ip_set_addresses" {
  description = "(Required) Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in Classless Inter-Domain Routing (CIDR) notation. AWS WAF supports all address ranges for IP versions IPv4 and IPv6."
  type        = list(string)
  default     = []
}

variable "ip_set_description" {
  description = "IP set description."
  type        = string
  default     = "This is an IP set."
}
