# Get certificate ARN
output "certificate_arn" {
  description = "Certificate ARN"
  value       = join("", aws_acm_certificate.this_cert_us_east_1.*.arn, aws_acm_certificate.this_cert.*.arn)
}
