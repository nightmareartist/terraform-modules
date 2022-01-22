### Common variables
variable "api_key" {
  description = "Datadog API key"
  type        = string
  default     = ""
}

variable "api_key_ssm_name" {
  description = "Name of ssm param that holds the Datadog API key"
  type        = string
  default     = ""
}

variable "app_key_ssm_name" {
  description = "Name of ssm param that holds the Datadog APP key"
  type        = string
  default     = ""
}

variable "api_url" {
  description = "Datadog API url"
  type        = string
  default     = ""
}

variable "app_key" {
  description = "Datadog APP key"
  type        = string
  default     = ""
}

variable "monitor_specs" {
  description = "List of all monitor specifications"
  type = list(object({
    message : string
    name : string
    query : string
    type : string
    enable_logs_sample : optional(bool)
    escalation_message : optional(string)
    evaluation_delay : optional(number)
    force_delete : optional(bool)
    groupby_simple_monitor : optional(bool)
    include_tags : optional(bool)
    locked : optional(bool)
    monitor_threshold_recovery_window : optional(string)
    monitor_threshold_trigger_window : optional(string)
    monitor_threshold_critical : optional(string)
    monitor_threshold_critical_recovery : optional(string)
    monitor_threshold_ok : optional(string)
    monitor_threshold_unknown : optional(string)
    monitor_threshold_warning : optional(string)
    monitor_threshold_warning_recovery : optional(string)
    new_host_delay : optional(number)
    no_data_timeframe : optional(number)
    notify_audit : optional(bool)
    notify_no_data : optional(bool)
    priority : optional(number)
    renotify_interval : optional(number)
    require_full_window : optional(bool)
    tag : optional(set(string))
    restricted_roles : optional(set(string))
    timeout_h : optional(number)
    validate : optional(bool)
  }))
  default = []
}
