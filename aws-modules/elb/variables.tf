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
  default = {
    Terraform   = "true"
    Environment = "development"
  }
}

### Module variables
variable "instances" {
  description = "Instances"
  type        = list(string)
  default     = []
}

variable "security_groups" {
  description = ""
  type        = list(string)
}

variable "cross_zone_load_balancing" {
  description = ""
  type        = bool
  default     = true
}

### Health Check Options
variable "health_check_interval" {
  description = "Health Check Interval"
  type        = number
  default     = 10
}

variable "health_check_timeout" {
  description = "Health Check Timeout"
  type        = number
  default     = 5
}

variable "health_check_target" {
  description = "Health Check Target"
  type        = string
}

# Listener Options
variable "listener_instance_port" {
  description = ""
  type        = number
}

variable "listener_ssl_certificate_id" {
  description = "Listener SSL certificate id"
  type        = string
}

variable "subnets" {
  description = "subnets"
  type        = list(string)
}
