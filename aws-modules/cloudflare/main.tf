provider "cloudflare" {
  version   = "~> 2.0"
  api_token = length(var.cloudflare_token) > 0 ? var.cloudflare_token : join("", data.aws_ssm_parameter.token.*.value)
}

# Use token from SSM
data "aws_ssm_parameter" "token" {
  count = var.enabled && length(var.cloudflare_token) == 0 ? 1 : 0
  name  = var.ssm_cloudflare_token
}

resource "cloudflare_record" "default" {
  count    = var.enabled ? 1 : 0
  zone_id  = var.cloudflare_zone_id
  name     = var.record_subdomain
  priority = var.record_priority
  value    = var.record_value
  type     = var.record_type
  ttl      = var.record_ttl
  proxied  = var.proxied
}

resource "cloudflare_page_rule" "default" {
  count    = var.enabled ? length(var.page_rule) : 0
  zone_id  = var.cloudflare_zone_id
  target   = var.page_rule[count.index]["target"]
  priority = lookup(var.page_rule[count.index], "priority", null)

  actions {
    ssl = lookup(var.page_rule[count.index], "ssl", null)

    dynamic "forwarding_url" {
      for_each = length(keys(lookup(var.page_rule[count.index], "forwarding_url", {}))) == 0 ? [] : [lookup(var.page_rule[count.index], "forwarding_url", {})]

      content {
        url         = lookup(var.page_rule[count.index].forwarding_url, "url")
        status_code = lookup(var.page_rule[count.index].forwarding_url, "status_code")
      }
    }
  }

}

