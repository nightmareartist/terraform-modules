locals {
  function_name = var.function_name
  dd_env_var    = { DD_API_KEY : data.aws_ssm_parameter.dd-api-key.value }
}

### Get datadog api key from SSM
data "aws_ssm_parameter" "dd-api-key" {
  name = var.dd_api_key_ssm_name
}

resource "aws_lambda_function" "default" {
  count = var.enabled ? 1 : 0

  function_name = local.function_name
  description   = var.description

  role = var.role_arn

  package_type = var.package_type
  image_uri    = var.image_uri
  image_config {
    command           = var.image_config_command
    entry_point       = var.image_config_entry_point
    working_directory = var.image_config_working_directory
  }

  reserved_concurrent_executions = var.reserved_concurrent_executions

  kms_key_arn = var.kms_key_arn

  dynamic "environment" {
    for_each = length(var.environment_variables) > 0 ? [true] : []

    content {
      variables = merge(var.environment_variables, local.dd_env_var)
    }
  }
}


