resource "aws_wafv2_ip_set" "main" {
  count              = var.create_ip_set ? 1 : 0
  name               = var.name
  description        = var.ip_set_description
  scope              = var.scope
  ip_address_version = var.ip_address_version
  addresses          = var.ip_set_addresses
  tags               = var.tags
}
