output "zone_id" {
  description = "ID of the hosted zone that contains the records"
  value       = join("", aws_route53_zone.default.*.zone_id)
}

output "zone_name" {
  description = "Name of the hosted zone that contains the records"
  value       = join("", aws_route53_zone.default.*.name)
}

output "name_servers" {
  description = "A list of name servers in associated (or default) delegation set"
  value       = join(",", aws_route53_zone.default[0].name_servers)
}

output "fqdn" {
  description = "FQDN for this zone"
  value       = aws_route53_record.ns.*.fqdn
}
