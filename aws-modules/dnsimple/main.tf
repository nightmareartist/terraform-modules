# Configure the DNSimple provider
provider "dnsimple" {
  account = length(var.dnsimple_account) > 0 ? var.dnsimple_account : join("", data.aws_ssm_parameter.account.*.value)
  token   = length(var.dnsimple_token) > 0 ? var.dnsimple_token : join("", data.aws_ssm_parameter.token.*.value)
  version = "~> 0.4"
}

# Use account from SSM
data "aws_ssm_parameter" "account" {
  count = var.enabled && length(var.dnsimple_account) == 0 ? 1 : 0
  name  = var.dnsimple_account
}

# Use token from SSM
data "aws_ssm_parameter" "token" {
  count = var.enabled && length(var.dnsimple_token) == 0 ? 1 : 0
  name  = var.ssm_dnsimple_token
}

# Create A record
resource "dnsimple_record" "any" {
  count = var.enabled && var.record_type != "NS" ? 1 : 0

  domain   = var.dnsimple_domain
  name     = var.record_subdomain
  value    = var.record_value
  priority = var.record_priority
  type     = var.record_type
  ttl      = var.record_ttl
}

# Create NS record
resource "dnsimple_record" "ns" {
  count = var.enabled && var.record_type == "NS" ? length(split(",", var.record_value)) : 0

  domain   = var.dnsimple_domain
  name     = var.record_subdomain
  value    = element(split(",", var.record_value), count.index)
  priority = var.record_priority
  type     = var.record_type
  ttl      = var.record_ttl
}
