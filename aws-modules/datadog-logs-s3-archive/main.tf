### Get datadog api key from SSM
data "aws_ssm_parameter" "dd-api-key" {
  name = var.api_key_ssm_name
}

### Get datadog app key from SSM
data "aws_ssm_parameter" "dd-app-key" {
  name = var.app_key_ssm_name
}

provider "datadog" {
  api_key = data.aws_ssm_parameter.dd-api-key.value
  app_key = data.aws_ssm_parameter.dd-app-key.value
  api_url = var.api_url
}

resource "datadog_logs_archive" "datadog_s3_archive" {
  name         = var.name
  query        = var.query
  include_tags = var.include_tags
  s3_archive {
    bucket     = var.bucket
    path       = var.path
    account_id = var.account_id
    role_name  = var.role_name
  }
}
