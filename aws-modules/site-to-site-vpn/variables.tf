variable "enabled" {
  description = "Set to `false` to prevent the module from creating any resources"
  type        = string
  default     = "true"
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

variable "vpc_id" {
  description = "The ID of the VPC to which the Virtual Private Gateway will be attached"
  type        = string
}

variable "vpn_gateway_id" {
  description = "VPN Gateway ID if you want to use existing gateway. AWS allows single VPN gateway per VPC: https://docs.aws.amazon.com/vpn/latest/s2svpn/vpn-limits.html"
  type        = string
  default     = ""
}

variable "enable_aws_vpn_gateway" {
  description = "Create VPC Gateway or use existing one"
  type        = bool
  default     = false
}

variable "vpn_gateway_amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the VPN gateway. If you don't specify an ASN, the Virtual Private Gateway is created with the default ASN"
  default     = 64512
}

variable "customer_gateway_bgp_asn" {
  description = "The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)"
  default     = 65000
}

variable "customer_gateway_ip_address" {
  description = "The IP address of the gateway's Internet-routable external interface"
  type        = string
}

variable "route_table_id" {
  description = "The IDs of the route tables for which routes from the Virtual Private Gateway will be propagated"
  type        = list(string)
  default     = []
}

variable "vpn_connection_static_routes_only" {
  description = "If set to `true`, the VPN connection will use static routes exclusively. Static routes must be used for devices that don't support BGP"
  type        = string
  default     = "true"
}

variable "vpn_connection_static_routes_destinations" {
  description = "List of CIDR blocks to be used as destination for static routes. Routes to destinations will be propagated to the route tables defined in `route_table_ids`"
  type        = list(string)
  default     = []
}

variable "vpn_connection_tunnel1_inside_cidr" {
  description = "The CIDR block of the inside IP addresses for the first VPN tunnel"
  type        = string
  default     = null
}

variable "vpn_connection_tunnel2_inside_cidr" {
  description = "The CIDR block of the inside IP addresses for the second VPN tunnel"
  type        = string
  default     = null
}

variable "vpn_connection_tunnel1_preshared_key" {
  description = "The preshared key of the first VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(_)"
  type        = string
  default     = null
}

variable "vpn_connection_tunnel2_preshared_key" {
  description = "The preshared key of the second VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(_)"
  type        = string
  default     = null
}

variable "vpn_connection_tunnel1_phase1_encryption_algorithms" {
  description = " (Optional) List of one or more encryption algorithms that are permitted for the second VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16"
  type        = list(string)
  default     = ["AES256", "AES256-GCM-16"]
}

variable "vpn_connection_tunnel2_phase1_encryption_algorithms" {
  description = " (Optional) List of one or more encryption algorithms that are permitted for the second VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16"
  type        = list(string)
  default     = ["AES256", "AES256-GCM-16"]
}

variable "vpn_connection_tunnel1_phase2_encryption_algorithms" {
  description = " (Optional) List of one or more encryption algorithms that are permitted for the second VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16"
  type        = list(string)
  default     = ["AES256", "AES256-GCM-16"]
}

variable "vpn_connection_tunnel2_phase2_encryption_algorithms" {
  description = " (Optional) List of one or more encryption algorithms that are permitted for the second VPN tunnel for phase 1 IKE negotiations. Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16"
  type        = list(string)
  default     = ["AES256", "AES256-GCM-16"]
}

variable "vpn_connection_tunnel1_phase1_integrity_algorithms" {
  description = "(Optional) One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512"
  type        = list(string)
  default     = ["SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "vpn_connection_tunnel2_phase1_integrity_algorithms" {
  description = "(Optional) One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512"
  type        = list(string)
  default     = ["SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "vpn_connection_tunnel1_phase2_integrity_algorithms" {
  description = "(Optional) One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512"
  type        = list(string)
  default     = ["SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "vpn_connection_tunnel2_phase2_integrity_algorithms" {
  description = "(Optional) One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512"
  type        = list(string)
  default     = ["SHA2-256", "SHA2-384", "SHA2-512"]
}

variable "vpn_connection_tunnel1_phase1_dh_group_numbers" {
  description = "(Optional) List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 1 IKE negotiations"
  type        = list(string)
  default     = ["2", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
}

variable "vpn_connection_tunnel2_phase1_dh_group_numbers" {
  description = "(Optional) List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 1 IKE negotiations"
  type        = list(string)
  default     = ["2", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
}

variable "vpn_connection_tunnel1_phase2_dh_group_numbers" {
  description = "(Optional) List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 1 IKE negotiations"
  type        = list(string)
  default     = ["2", "5", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
}

variable "vpn_connection_tunnel2_phase2_dh_group_numbers" {
  description = "(Optional) List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 1 IKE negotiations"
  type        = list(string)
  default     = ["2", "5", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
}

variable "vpn_connection_tunnel1_ike_versions" {
  description = "(Optional) The IKE versions that are permitted for the first VPN tunnel"
  type        = list(string)
  default     = ["ikev1", "ikev2"]
}

variable "vpn_connection_tunnel2_ike_versions" {
  description = "(Optional) The IKE versions that are permitted for the first VPN tunnel"
  type        = list(string)
  default     = ["ikev1", "ikev2"]
}
