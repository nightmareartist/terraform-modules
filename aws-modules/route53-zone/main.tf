locals {
  type        = length(var.vpc) > 0 ? "Private" : "Public"
  description = "${local.type} zone for ${var.domain}"
  managed_by  = "terraform"
}

resource "aws_route53_zone" "default" {
  count = var.enabled ? 1 : 0
  name  = var.domain

  dynamic "vpc" {
    for_each = var.vpc
    content {
      vpc_id = vpc.value["vpc_id"]
    }
  }

  comment       = local.description
  force_destroy = var.force_destroy

  tags = var.tags
}

resource "aws_route53_record" "ns" {
  count           = var.enabled ? 1 : 0
  allow_overwrite = true
  name            = var.domain
  ttl             = 30
  type            = "NS"
  zone_id         = join("", aws_route53_zone.default.*.zone_id)

  records = [
    join("", aws_route53_zone.default.*.name_servers.0),
    join("", aws_route53_zone.default.*.name_servers.1),
    join("", aws_route53_zone.default.*.name_servers.2),
    join("", aws_route53_zone.default.*.name_servers.3),
  ]
}

resource "aws_route53_record" "soa" {
  count           = var.enabled ? 1 : 0
  allow_overwrite = true
  name            = var.domain
  ttl             = 30
  type            = "SOA"
  zone_id         = join("", aws_route53_zone.default.*.zone_id)

  records = [
    format("%s %s %s %s %s %s %s", join("", aws_route53_zone.default.*.name_servers.2), "awsdns-hostmaster.awsdns.com.", "1", "7200", "900", "1209600", "86400")
  ]
}
