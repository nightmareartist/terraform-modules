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

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE"
  type        = string
  default     = "MUTABLE"
}

variable "principals_full_access" {
  description = "Principal ARNs to provide with full access to the ECR"
  type        = list(string)
  default     = []
}

variable "principals_readonly_access" {
  description = "Principal ARNs to provide with readonly access to the ECR"
  type        = list(string)
  default     = []
}

variable "scan_images_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not (false)"
  type        = bool
  default     = true
}

variable "max_image_count" {
  description = "How many Docker Image versions AWS ECR will store"
  default     = 500
}
