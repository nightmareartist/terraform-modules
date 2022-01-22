output "stream_arn" {
  value       = aws_kinesis_stream.default.arn
  description = "AWS Kinesis Stream ARN."
}
