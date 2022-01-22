# Datadog Forwarder to ship logs from S3 and CloudWatch, as well as observability data from Lambda functions to Datadog.
# https://github.com/DataDog/datadog-serverless-functions/tree/master/aws/logs_monitoring

resource "aws_s3_bucket_notification" "s3_bucket_notification" {
  bucket = var.bucket_name
  lambda_function {
    lambda_function_arn = var.forwarder_arn
    events              = var.bucket_events
    filter_prefix       = var.bucket_filter_prefix
    filter_suffix       = var.bucket_filter_suffix
  }
}
