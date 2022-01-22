### Get datadog api key from SSM
data "aws_ssm_parameter" "dd-api-key" {
  name = var.api_key_ssm_name
}

### Get datadog app key from SSM
data "aws_ssm_parameter" "dd-app-key" {
  name = var.app_key_ssm_name
}

# Configure the datadog provide
provider "datadog" {
  api_key = data.aws_ssm_parameter.dd-api-key.value
  app_key = data.aws_ssm_parameter.dd-app-key.value
  api_url = var.api_url
}

# Create a new Datadog - Amazon Web Services integration
resource "datadog_integration_aws" "dd-aws-integration" {
  account_id       = var.account_id
  role_name        = var.role_name
  filter_tags      = var.filter_tags
  host_tags        = var.host_tags
  excluded_regions = var.excluded_regions
}
