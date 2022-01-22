output "stream_arn" {
  value       = aws_kinesis_firehose_delivery_stream.default.arn
  description = "AWS Kinesis Stream ARN."
}
