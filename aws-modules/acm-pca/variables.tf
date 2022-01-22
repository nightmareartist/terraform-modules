variable "ca_enabled" {
  description = "(Optional) Whether the certificate authority is enabled or disabled. Defaults to true."
  type        = bool
  default     = true
}

variable "key_algorithm" {
  description = "(Required) Type of the public key algorithm and size, in bits, of the key pair that your key pair creates when it issues a certificate. Valid values can be found in the: https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CertificateAuthorityConfiguration.html"
  type        = string
  default     = "EC_secp384r1"
}

variable "signing_algorithm" {
  description = "(Required) Name of the algorithm your private CA uses to sign certificate requests. Valid values can be found in the: https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CertificateAuthorityConfiguration.html"
  type        = string
  default     = "SHA512WITHECDSA"
}

variable "common_name" {
  description = "(Optional) Fully qualified domain name (FQDN) associated with the certificate subject. Must be less than or equal to 64 characters in length."
  type        = string
  default     = ""
}

variable "country" {
  description = "(Optional) Two digit code that specifies the country in which the certificate subject located. Must be less than or equal to 2 characters in length."
  type        = string
  default     = "SE"
}

variable "distinguished_name_qualifier" {
  description = "(Optional) Disambiguating information for the certificate subject. Must be less than or equal to 64 characters in length."
  type        = string
  default     = ""
}

variable "generation_qualifier" {
  description = "(Optional) Typically a qualifier appended to the name of an individual. Examples include Jr. for junior, Sr. for senior, and III for third. Must be less than or equal to 3 characters in length."
  type        = string
  default     = ""
}

variable "given_name" {
  description = "(Optional) First name. Must be less than or equal to 16 characters in length."
  type        = string
  default     = ""
}

variable "initials" {
  description = "(Optional) Concatenation that typically contains the first letter of the given_name, the first letter of the middle name if one exists, and the first letter of the surname. Must be less than or equal to 5 characters in length."
  type        = string
  default     = ""
}

variable "locality" {
  description = "(Optional) The locality (such as a city or town) in which the certificate subject is located. Must be less than or equal to 128 characters in length."
  type        = string
  default     = "Stockholm"
}

variable "organization" {
  description = "(Optional) Legal name of the organization with which the certificate subject is affiliated. Must be less than or equal to 64 characters in length."
  type        = string
  default     = "Organization"
}

variable "organizational_unit" {
  description = "(Optional) A subdivision or unit of the organization (such as sales or finance) with which the certificate subject is affiliated. Must be less than or equal to 64 characters in length."
  type        = string
  default     = ""
}

variable "pseudonym" {
  description = "(Optional) Typically a shortened version of a longer given_name. For example, Jonathan is often shortened to John. Elizabeth is often shortened to Beth, Liz, or Eliza. Must be less than or equal to 128 characters in length."
  type        = string
  default     = ""
}

variable "state" {
  description = "(Optional) State in which the subject of the certificate is located. Must be less than or equal to 128 characters in length."
  type        = string
  default     = ""
}

variable "surname" {
  description = "(Optional) Family name. In the US and the UK for example, the surname of an individual is ordered last. In Asian cultures the surname is typically ordered first. Must be less than or equal to 40 characters in length."
  type        = string
  default     = ""
}

variable "title" {
  description = "(Optional) A title such as Mr. or Ms. which is pre-pended to the name to refer formally to the certificate subject. Must be less than or equal to 64 characters in length."
  type        = string
  default     = ""
}

variable "type" {
  description = "(Optional) The type of the certificate authority. Defaults to SUBORDINATE. Valid values: ROOT and SUBORDINATE"
  type        = string
  default     = "ROOT"
}

variable "tags" {
  description = "Default tags."
  type        = map(string)
  default     = {}
}

variable "permanent_deletion_time_in_days" {
  description = "(Optional) The number of days to make a CA restorable after it has been deleted, must be between 7 to 30 days, with default to 30 days."
  type        = number
  default     = 7
}

variable "crl_enabled" {
  description = "(Optional) Boolean value that specifies whether certificate revocation lists (CRLs) are enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "custom_cname" {
  description = "(Optional) Name inserted into the certificate CRL Distribution Points extension that enables the use of an alias for the CRL distribution point. Use this value if you don't want the name of your S3 bucket to be public. Must be less than or equal to 253 characters in length."
  type        = string
  default     = ""
}

variable "expiration_in_days" {
  description = "(Required) Number of days until a certificate expires. Must be between 1 and 5000."
  type        = number
  default     = 10
}

variable "s3_bucket_name" {
  description = "(Optional) Name of the S3 bucket that contains the CRL. If you do not provide a value for the custom_cname argument, the name of your S3 bucket is placed into the CRL Distribution Points extension of the issued certificate. You must specify a bucket policy that allows ACM PCA to write the CRL to your bucket. Must be less than or equal to 255 characters in length."
  type        = string
  default     = ""
}
