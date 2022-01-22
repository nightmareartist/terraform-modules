# Datadog Forwarder to ship logs from S3 and CloudWatch, as well as observability data from Lambda functions to Datadog.
# https://github.com/DataDog/datadog-serverless-functions/tree/master/aws/logs_monitoring

### Get datadog app key from SSM
data "aws_ssm_parameter" "dd-api-key" {
  name = var.dd_api_key_ssm_name
}

resource "aws_cloudformation_stack" "datadog_forwarder" {
  name         = var.forwarder_name
  capabilities = var.capabilities
  parameters = {
    DdApiKey     = data.aws_ssm_parameter.dd-api-key.value
    FunctionName = var.function_name
    DdSite       = var.dd_api_url
    DdTags       = var.dd_tags
  }
  template_url = "https://datadog-cloudformation-template.s3.amazonaws.com/aws/forwarder/latest.yaml"
}
