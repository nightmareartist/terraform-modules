variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
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

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = ""
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = ""
}

variable "policy" {
  description = "(Optional) The fully-formed AWS policy as JSON. For more information about building AWS IAM policy documents with Terraform, see: https://learn.hashicorp.com/terraform/aws/iam-policy"
  type        = string
  default     = ""
}

variable "delivery_policy" {
  description = "(Optional) The SNS delivery policy. More on: https://docs.aws.amazon.com/sns/latest/dg/DeliveryPolicies.html"
  type        = string
  default     = ""
}
