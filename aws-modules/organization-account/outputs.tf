output "organization-arn" {
  description = "Organization ARN"
  value       = aws_organizations_account.account.arn
}

output "organization-id" {
  description = "Organization ID"
  value       = aws_organizations_account.account.id
}
