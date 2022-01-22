variable "create_waf_acl" {
  description = "Whether to create WAF ACL or not."
  type        = bool
  default     = false
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

variable "default_action" {
  description = "WAF default action"
  type        = string
  default     = "block"
}

variable "web_acl_description" {
  description = "WAF ACL description."
  type        = string
  default     = "This is a WAF ACL."
}

variable "scope" {
  type        = string
  description = "The scope of this Web ACL. Valid options: CLOUDFRONT, REGIONAL."
  default     = "REGIONAL"
}

variable "cloudwatch_metrics_enabled" {
  description = "(Required) A boolean indicating whether the associated resource sends metrics to CloudWatch. For the list of available metrics, see AWS WAF Metrics."
  type        = bool
  default     = true
}

variable "sampled_requests_enabled" {
  description = "(Required) A boolean indicating whether AWS WAF should store a sampling of the web requests that match the rules. You can view the sampled requests through the AWS WAF console."
  type        = bool
  default     = true
}

variable "managed_rules" {
  type = list(object({
    name            = string
    priority        = number
    override_action = string
    excluded_rules  = list(string)
  }))
  description = "List of Managed WAF rules."
  default = [
    {
      name            = "AWSManagedRulesCommonRuleSet",
      priority        = 10
      override_action = "none"
      excluded_rules  = []
    },
    {
      name            = "AWSManagedRulesAmazonIpReputationList",
      priority        = 20
      override_action = "none"
      excluded_rules  = []
    },
    {
      name            = "AWSManagedRulesKnownBadInputsRuleSet",
      priority        = 30
      override_action = "none"
      excluded_rules  = []
    },
    {
      name            = "AWSManagedRulesSQLiRuleSet",
      priority        = 40
      override_action = "none"
      excluded_rules  = []
    },
    {
      name            = "AWSManagedRulesLinuxRuleSet",
      priority        = 50
      override_action = "none"
      excluded_rules  = []
    },
    {
      name            = "AWSManagedRulesUnixRuleSet",
      priority        = 60
      override_action = "none"
      excluded_rules  = []
    }
  ]
}

variable "ip_sets_rule" {
  type = list(object({
    name       = string
    priority   = number
    ip_set_arn = string
    action     = string
  }))
  description = "A rule to detect web requests coming from particular IP addresses or address ranges."
  default     = []
}

variable "file_upload_rule" {
  description = "A rule to block uploading files of certain size(bypassing AWS managed rule limit of 4K)."
  type = list(object({
    name                = string
    priority            = number
    comparison_operator = string
    size                = number
  }))
  default = []
}

variable "path_rule" {
  description = "A rule to regulate access to certain paths from any IP."
  type = list(object({
    name                       = string
    priority                   = number
    action                     = string
    positional_constraint      = string
    search_string              = string
    cloudwatch_metrics_enabled = bool
  }))
  default = []
}

variable "single_header_rule" {
  description = "A rule to regulate access to certain hosts."
  type = list(object({
    name                       = string
    priority                   = number
    action                     = string
    positional_constraint      = string
    search_string              = string
    header_name                = string
    cloudwatch_metrics_enabled = bool
  }))
  default = []
}

variable "single_header_ipset_rule" {
  description = "A rule to regulate access to certain hosts from IP sets."
  type = list(object({
    name                       = string
    priority                   = number
    action                     = string
    ip_set_arn                 = string
    positional_constraint      = string
    search_string              = string
    header_name                = string
    cloudwatch_metrics_enabled = bool
  }))
  default = []
}

variable "single_header_ipset_path_rule" {
  description = "A rule to regulate to specific hosts from specific IPs to specific paths"
  type = list(object({
    name                           = string
    priority                       = number
    action                         = string
    ip_set_arn                     = string
    header_positional_constraint   = string
    header_search_string           = string
    header_name                    = string
    uri_path_positional_constraint = string
    uri_path_search_string         = string
    cloudwatch_metrics_enabled     = bool
  }))
  default = []
}

variable "path_ipset_rule" {
  description = "A rule to regulate access to certain paths from IP sets."
  type = list(object({
    name                       = string
    priority                   = number
    action                     = string
    ip_set_arn                 = string
    positional_constraint      = string
    search_string              = string
    cloudwatch_metrics_enabled = bool
  }))
  default = []
}

# Setup logging variables
variable "enable_logging" {
  description = "Enable WAF logging."
  type        = bool
  default     = false
}

variable "log_destination_configs" {
  description = "(Required) The Amazon Kinesis Data Firehose Amazon Resource Name (ARNs) that you want to associate with the web ACL. Currently, only 1 ARN is supported."
  type        = list(string)
  default     = []
}

variable "single_header_name" {
  description = "(Optional) The name of the query header to redact. This setting must be provided as lower case characters."
  type        = string
  default     = ""
}

# Associate with ALB variables
variable "associate_alb" {
  type        = bool
  description = "Whether to associate an ALB with the WAFv2 ACL."
  default     = false
}

variable "alb_arn" {
  type        = string
  description = "ARN of the ALB to be associated with the WAFv2 ACL."
  default     = ""
}
