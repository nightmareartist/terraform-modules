terraform {
  experiments = [module_variable_optional_attrs]
}

### Get datadog api key from SSM
data "aws_ssm_parameter" "dd-api-key" {
  name = var.api_key_ssm_name
}

### Get datadog app key from SSM
data "aws_ssm_parameter" "dd-app-key" {
  name = var.app_key_ssm_name
}

provider "datadog" {
  api_key = data.aws_ssm_parameter.dd-api-key.value
  app_key = data.aws_ssm_parameter.dd-app-key.value
  api_url = var.api_url
}

resource "datadog_monitor" "dd-monitor" {
  count                  = length(var.monitor_specs)
  message                = try(var.monitor_specs[count.index].message, "")
  name                   = var.monitor_specs[count.index].name
  query                  = var.monitor_specs[count.index].query
  type                   = var.monitor_specs[count.index].type
  enable_logs_sample     = try(var.monitor_specs[count.index].enable_logs_sample, false)
  escalation_message     = try(var.monitor_specs[count.index].escalation_message, "")
  evaluation_delay       = try(var.monitor_specs[count.index].evaluation_delay, 0)
  force_delete           = try(var.monitor_specs[count.index].force_delete, false)
  groupby_simple_monitor = try(var.monitor_specs[count.index].groupby_simple_monitor, false)
  include_tags           = try(var.monitor_specs[count.index].include_tags, true)
  locked                 = try(var.monitor_specs[count.index].locked, false)
  monitor_threshold_windows {
    recovery_window = try(var.monitor_specs[count.index].monitor_threshold_recovery_window, "")
    trigger_window  = try(var.monitor_specs[count.index].monitor_threshold_trigger_window, "")
  }
  monitor_thresholds {
    critical          = try(var.monitor_specs[count.index].monitor_threshold_critical, "")
    critical_recovery = try(var.monitor_specs[count.index].monitor_threshold_critical_recovery, "")
    ok                = try(var.monitor_specs[count.index].monitor_threshold_ok, "")
    unknown           = try(var.monitor_specs[count.index].monitor_threshold_unknown, "")
    warning           = try(var.monitor_specs[count.index].monitor_threshold_warning, "")
    warning_recovery  = try(var.monitor_specs[count.index].monitor_threshold_warning_recovery, "")
  }
  new_host_delay      = try(var.monitor_specs[count.index].new_host_delay, 0)
  no_data_timeframe   = try(var.monitor_specs[count.index].no_data_timeframe, 0)
  notify_audit        = try(var.monitor_specs[count.index].notify_audit, false)
  notify_no_data      = try(var.monitor_specs[count.index].notify_no_data, false)
  priority            = try(var.monitor_specs[count.index].priority, 0)
  renotify_interval   = try(var.monitor_specs[count.index].renotify_interval, 0)
  require_full_window = try(var.monitor_specs[count.index].require_full_window, false)
  tags                = try(var.monitor_specs[count.index].tags, [])
  restricted_roles    = try(var.monitor_specs[count.index].restricted_roles, [])
  timeout_h           = try(var.monitor_specs[count.index].timeout_h, 0)
  validate            = try(var.monitor_specs[count.index].validate, true)
}
