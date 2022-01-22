variable "enabled" {
  description = "A boolean to enable/disable resource creation"
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

variable "profile_name" {
  description = "The profile's name. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = ""
}

variable "role_name" {
  description = "The role name to include in the profile"
  type        = string
  default     = ""
}
