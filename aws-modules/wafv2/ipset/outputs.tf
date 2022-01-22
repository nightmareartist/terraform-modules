output "ip_set_arn" {
  description = "The ARN of the IP set."
  value       = concat(aws_wafv2_ip_set.main.*.arn, [""])[0]
}
