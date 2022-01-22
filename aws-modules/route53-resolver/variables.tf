variable "enabled" {
  description = "A boolean to enable/disable resource creation"
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

variable "direction" {
  description = "(Required) The direction of DNS queries to or from the Route 53 Resolver endpoint. Valid values are INBOUND (resolver forwards DNS queries to the DNS service for a VPC from your network or another VPC) or OUTBOUND (resolver forwards DNS queries from the DNS service for a VPC to your network or another VPC)"
  type        = string
  default     = ""
}

variable "security_groups" {
  description = "(Required) The ID of one or more security groups that you want to use to control access to this VPC"
  type        = list(string)
  default     = []
}

variable "ip_address" {
  description = "(Required) The subnets and IP addresses in your VPC that you want DNS queries to pass through on the way from your VPCs to your network (for outbound endpoints) or on the way from your network to your VPCs (for inbound endpoints)"
  type        = list(map(string))
  default     = []
}
