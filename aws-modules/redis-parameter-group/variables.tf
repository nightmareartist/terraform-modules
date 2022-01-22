### Null label variables
variable "namespace" {
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
  type        = string
  default     = ""
}

variable "stage" {
  description = "Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release'"
  type        = string
  default     = ""
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "delimiter" {
  description = "Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`"
  type        = string
  default     = "-"
}

variable "attributes" {
  description = "Additional attributes (e.g. `1`)"
  type        = list(string)
  default     = []
}

variable "label_order" {
  description = "The naming order of the id output and Name tag"
  type        = list(string)
  default     = []
}

variable "regex_replace_chars" {
  description = "Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed"
  type        = string
  default     = "/[^a-zA-Z0-9-]/"
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "enabled" {
  description = "A boolean to enable/disable resource creation"
  type        = bool
  default     = true
}

### Module variables
variable "family" {
  description = "The family of the ElastiCache parameter group ()"
  type        = string
  default     = "redis5.0"
}

### Module variables
variable "parameters" {
  description = "A list of ElastiCache parameters to apply."
  type        = any
  default     = []
}

variable "description" {
  description = "The description of the ElastiCache parameter group."
  type        = string
  default     = ""
}
