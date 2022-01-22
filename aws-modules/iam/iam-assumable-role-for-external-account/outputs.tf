output "name" {
  value       = join("", aws_iam_role.this.*.name)
  description = "The name of generated IAM role"
}

output "arn" {
  value       = join("", aws_iam_role.this.*.arn)
  description = "The ARN of generated IAM role"
}
