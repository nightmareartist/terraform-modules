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

variable "alias" {
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash"
  type        = string
  default     = ""
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  default     = 10
}

variable "description" {
  description = "The description of the key as viewed in AWS console"
  type        = string
  default     = "Parameter Store KMS master key"
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Key specific name"
  type        = string
  default     = ""
}

variable "policy" {
  description = "A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy"
  type        = string
  default     = ""
}

variable "key_usage" {
  description = "(Optional) Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY. Defaults to ENCRYPT_DECRYPT"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "customer_master_key_spec" {
  description = "(Optional) Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "is_enabled" {
  description = "(Optional) Specifies whether the key is enabled. Defaults to true"
  type        = bool
  default     = true
}
