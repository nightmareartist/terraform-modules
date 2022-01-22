### Common variables
variable "namespace" {
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "environment" {
  description = "environment, which could be your organization name, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "name" {
  description = "Service name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default tags."
  type        = map(string)
  default     = {}
}

### Module variables
variable "domain" {
  description = "Domain to be used for this certificate"
  type        = string
  default     = ""
}

variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform. "
  type        = string
  default     = "DNS"
}

variable "certificate_transparency_logging_preference" {
  description = "Specifies whether certificate details should be added to a certificate transparency log. Valid values are ENABLED or DISABLED. See https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency for more details."
  type        = string
  default     = "ENABLED"
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = list(string)
  default     = []
}

variable "cloudfront_certificate" {
  description = "If set to true certificate will be issued in us-easst-1 region"
  type        = bool
  default     = false
}
