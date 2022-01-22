variable "enabled" {
  description = " (Optional) Whether the rule should be enabled (defaults to true)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "function_name" {
  description = "(Required) A unique name for the Lambda function."
  type        = string
}

variable "description" {
  description = "(Optional) A description of what the Lambda function does."
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "(Optional) A map of environment variables to pass to the Lambda function. AWS will automatically encrypt these with KMS if a key is provided and decrypt them when running the function."
  type        = map(string)
  default     = {}
}

variable "filename" {
  description = "(Optional) The path to the .zip file that contains the Lambda function source code."
  type        = string
  default     = null
}

variable "kms_key_arn" {
  description = "(Optional) The ARN for the KMS encryption key that is used to encrypt environment variables. If none is provided when environment variables are in use, AWS Lambda uses a default service key."
  type        = string
  default     = null
}

variable "reserved_concurrent_executions" {
  description = "(Optional) The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. For details see https://docs.aws.amazon.com/lambda/latest/dg/invocation-scaling.html"
  type        = string
  default     = "-1"
}

variable "role_arn" {
  description = "(Optional) The ARN of the policy that is used to set the permissions boundary for the IAM role for the Lambda function."
  type        = string
  default     = null
}

variable "type" {
  type    = string
  default = null
}

variable "publish" {
  description = "(Optional) Whether to publish creation/change as new Lambda function. This allows you to use aliases to refer to execute different versions of the function in different environments."
  type        = bool
  default     = false
}

variable "package_type" {
  type        = string
  default     = "Image"
  description = "Lambda deployment package type. Valid values are Zip and Image"
}

variable "image_uri" {
  type        = string
  default     = ""
  description = "(Optional) ECR image URI containing the function's deployment package."
}

variable "image_config_command" {
  type        = list(string)
  default     = []
  description = "Container image configuration cmd value that override the values in the container image Dockerfile."
}

variable "image_config_entry_point" {
  type        = list(string)
  default     = []
  description = "Container image configuration entrypoint value that override the values in the container image Dockerfile."
}

variable "image_config_working_directory" {
  type        = string
  default     = null
  description = "Container image configuration workdir value that override the values in the container image Dockerfile."
}

variable "dd_api_key_ssm_name" {
  type        = string
  default     = ""
  description = "(Optional)DD api key in ssm."
}
