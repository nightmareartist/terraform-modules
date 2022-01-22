variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "environment, which could be your organization name, e.g. 'eg' or 'cp'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Service name, e.g. 'app' or 'jenkins'"
}

variable "tags" {
  type        = map(string)
  description = "Default tags"
  default     = {}
}

variable "zone_id" {
  description = "Zone which will host this record"
  type        = string
  default     = null
}

variable "type" {
  description = "Type of DNS record"
  type        = string
  default     = "CNAME"
}

variable "ttl" {
  description = "Time To Live for DNS record in minutes"
  type        = number
  default     = 60
}

variable "records" {
  description = "DNS records"
  type        = list(string)
  default     = []
}
