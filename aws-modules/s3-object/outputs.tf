output "aws_s3_bucket_object" {
  value       = join("", aws_s3_bucket_object.default.*.id)
  description = "Connection ID"
}
