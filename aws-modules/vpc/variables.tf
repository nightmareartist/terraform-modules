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

variable "availability_zones" {
  description = "Availability zones to be used within VPC."
  type        = list(string)
}

variable "cidr" {
  description = "CIDR range for VPC."
}

variable "database_subnets" {
  description = "A list of database subnets inside the VPC."
  type        = list(string)
  default     = []
}

variable "enable_nat_gateway" {
  description = "Provision NAT Gateways for each of private networks."
  default     = true
}

variable "enable_ipv6" {
  description = "Enable IPv6 support."
  default     = false
}

variable "enable_vpn_gateway" {
  description = "Create a new VPN Gateway resource and attach it to the VPC."
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS."
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS resolving."
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Should public IPs be assigned at launch."
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "Enable one NAT gateway per Availability Zone."
  default     = false
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  type        = list(string)
  default     = []
}

variable "single_nat_gateway" {
  description = "Enable single NAT gateway."
  default     = false
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "d"
}

variable "aws_default_security_group_ingress" {
  description = "aws_default_security_group_ingress"
  type        = any
  default     = []
}

variable "aws_default_security_group_egress" {
  description = "aws_default_security_group_egress"
  type        = any
  default     = []
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}
