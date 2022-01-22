data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

locals {
  region       = data.aws_region.current.name
  account_id   = data.aws_caller_identity.current.account_id
  function_arn = "arn:aws:lambda:${local.region}:${local.account_id}:function:${var.function_name}"
}

output "guessed_function_arn" {
  description = "Guessed function arn in the format: arn:aws:lambda:<region>:<account_id>:function:<function_name>"
  value       = local.function_arn
}

output "function_name" {
  value = local.function_name
}
