### WAFv2 ACL
resource "aws_wafv2_web_acl" "main" {
  count       = var.create_waf_acl ? 1 : 0
  name        = var.name
  description = var.web_acl_description
  scope       = var.scope
  tags        = var.tags

  default_action {
    dynamic "allow" {
      for_each = var.default_action == "allow" ? [1] : []
      content {}
    }

    dynamic "block" {
      for_each = var.default_action == "block" ? [1] : []
      content {}
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.cloudwatch_metrics_enabled
    sampled_requests_enabled   = var.sampled_requests_enabled
    metric_name                = var.name
  }

  # Managed rules
  dynamic "rule" {
    for_each = var.managed_rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

      override_action {
        dynamic "none" {
          for_each = rule.value.override_action == "none" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = rule.value.override_action == "count" ? [1] : []
          content {}
        }
      }

      statement {
        managed_rule_group_statement {
          name        = rule.value.name
          vendor_name = "AWS"

          dynamic "excluded_rule" {
            for_each = rule.value.excluded_rules
            content {
              name = excluded_rule.value
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  # IP sets rule (requires ip_set to be added)
  dynamic "rule" {
    for_each = var.ip_sets_rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        dynamic "allow" {
          for_each = rule.value.action == "allow" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = rule.value.action == "count" ? [1] : []
          content {}
        }

        dynamic "block" {
          for_each = rule.value.action == "block" ? [1] : []
          content {}
        }
      }

      statement {
        ip_set_reference_statement {
          arn = rule.value.ip_set_arn
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  # Limit file upload size
  dynamic "rule" {
    for_each = var.file_upload_rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        block {}
      }

      statement {
        size_constraint_statement {
          comparison_operator = rule.value.comparison_operator
          size                = rule.value.size

          field_to_match {
            query_string {}
          }

          text_transformation {
            priority = 0
            type     = "NONE"
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  # Single header rule
  dynamic "rule" {
    for_each = var.single_header_rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        dynamic "allow" {
          for_each = rule.value.action == "allow" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = rule.value.action == "count" ? [1] : []
          content {}
        }

        dynamic "block" {
          for_each = rule.value.action == "block" ? [1] : []
          content {}
        }
      }

      statement {

        byte_match_statement {
          positional_constraint = rule.value.positional_constraint
          search_string         = rule.value.search_string

          field_to_match {
            single_header {
              name = rule.value.header_name
            }
          }

          text_transformation {
            priority = 0
            type     = "NONE"
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  # Single header + IP set rule
  dynamic "rule" {
    for_each = var.single_header_ipset_rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        dynamic "allow" {
          for_each = rule.value.action == "allow" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = rule.value.action == "count" ? [1] : []
          content {}
        }

        dynamic "block" {
          for_each = rule.value.action == "block" ? [1] : []
          content {}
        }
      }

      statement {
        and_statement {
          statement {

            ip_set_reference_statement {
              arn = rule.value.ip_set_arn
            }
          }
          statement {

            byte_match_statement {
              positional_constraint = rule.value.positional_constraint
              search_string         = rule.value.search_string

              field_to_match {
                single_header {
                  name = rule.value.header_name
                }
              }

              text_transformation {
                priority = 0
                type     = "NONE"
              }
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  # Single header + IP set rule + path (limiting access from an IP set to a specific domain and a specific path)
  dynamic "rule" {
    for_each = var.single_header_ipset_path_rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        dynamic "allow" {
          for_each = rule.value.action == "allow" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = rule.value.action == "count" ? [1] : []
          content {}
        }

        dynamic "block" {
          for_each = rule.value.action == "block" ? [1] : []
          content {}
        }
      }

      statement {
        and_statement {

          statement {

            ip_set_reference_statement {
              arn = rule.value.ip_set_arn
            }
          }

          statement {

            byte_match_statement {
              positional_constraint = rule.value.header_positional_constraint
              search_string         = rule.value.header_search_string

              field_to_match {
                single_header {
                  name = rule.value.header_name
                }
              }

              text_transformation {
                priority = 0
                type     = "NONE"
              }
            }
          }

          statement {

            byte_match_statement {
              positional_constraint = rule.value.uri_path_positional_constraint
              search_string         = rule.value.uri_path_search_string

              field_to_match {
                uri_path {}
              }

              text_transformation {
                priority = 0
                type     = "NONE"
              }
            }
          }

        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  # Path rule for any IP
  dynamic "rule" {
    for_each = var.path_rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        dynamic "allow" {
          for_each = rule.value.action == "allow" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = rule.value.action == "count" ? [1] : []
          content {}
        }

        dynamic "block" {
          for_each = rule.value.action == "block" ? [1] : []
          content {}
        }
      }

      statement {

        byte_match_statement {
          positional_constraint = rule.value.positional_constraint
          search_string         = rule.value.search_string

          field_to_match {
            uri_path {}
          }

          text_transformation {
            priority = 0
            type     = "NONE"
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = rule.value.cloudwatch_metrics_enabled
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }

  # Path protection for specific IP sets
  dynamic "rule" {
    for_each = var.path_ipset_rule
    content {
      name     = rule.value.name
      priority = rule.value.priority

      action {
        dynamic "allow" {
          for_each = rule.value.action == "allow" ? [1] : []
          content {}
        }

        dynamic "count" {
          for_each = rule.value.action == "count" ? [1] : []
          content {}
        }

        dynamic "block" {
          for_each = rule.value.action == "block" ? [1] : []
          content {}
        }
      }

      statement {
        and_statement {
          statement {

            ip_set_reference_statement {
              arn = rule.value.ip_set_arn
            }
          }
          statement {

            byte_match_statement {
              positional_constraint = rule.value.positional_constraint
              search_string         = rule.value.search_string

              field_to_match {
                uri_path {}
              }

              text_transformation {
                priority = 0
                type     = "NONE"
              }
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = rule.value.cloudwatch_metrics_enabled
        metric_name                = rule.value.name
        sampled_requests_enabled   = true
      }
    }
  }
}

## Setup WAF logging
resource "aws_wafv2_web_acl_logging_configuration" "main" {
  count                   = var.enable_logging ? 1 : 0
  log_destination_configs = var.log_destination_configs
  resource_arn            = join("", aws_wafv2_web_acl.main.*.arn)
}

# Associate WAF viwth an ALB
resource "aws_wafv2_web_acl_association" "main" {
  count        = var.associate_alb ? 1 : 0
  resource_arn = var.alb_arn
  web_acl_arn  = join("", aws_wafv2_web_acl.main.*.arn)
}
