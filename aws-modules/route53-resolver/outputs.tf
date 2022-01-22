output "resolver_assigned_ip" {
  description = "IP addresses assigned to resolver"
  value       = [for v in aws_route53_resolver_endpoint.default.ip_address : v.ip]
}
