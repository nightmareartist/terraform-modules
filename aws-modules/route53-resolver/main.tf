resource "aws_route53_resolver_endpoint" "default" {
  name               = format("%s-%s-%s", var.namespace, var.environment, var.name)
  direction          = var.direction
  security_group_ids = var.security_groups

  dynamic "ip_address" {
    for_each = var.ip_address

    content {
      subnet_id = ip_address.value.subnet_id
      ip        = lookup(ip_address.value, "ip", null)
    }
  }
  tags = var.tags
}
