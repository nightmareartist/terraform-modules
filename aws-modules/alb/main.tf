resource "aws_lb" "this" {
  count = var.create_lb ? 1 : 0

  name               = var.name
  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  security_groups    = var.security_groups
  subnets            = var.subnets

  idle_timeout                     = var.idle_timeout
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  ip_address_type                  = var.ip_address_type

  dynamic "access_logs" {
    for_each = length(keys(var.access_logs)) == 0 ? [] : [var.access_logs]

    content {
      enabled = lookup(access_logs.value, "enabled", lookup(access_logs.value, "bucket", null) != null)
      bucket  = lookup(access_logs.value, "bucket", null)
      prefix  = lookup(access_logs.value, "prefix", null)
    }
  }

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping

    content {
      subnet_id     = subnet_mapping.value.subnet_id
      allocation_id = lookup(subnet_mapping.value, "allocation_id", null)
    }
  }

  tags = var.tags

  timeouts {
    create = var.load_balancer_create_timeout
    update = var.load_balancer_update_timeout
    delete = var.load_balancer_delete_timeout
  }
}

# Create target group
resource "aws_lb_target_group" "main" {
  count = var.create_lb ? length(var.target_groups) : 0

  name        = format("%s-%s-%s", var.namespace, var.environment, lookup(var.target_groups[count.index], "name", null))
  vpc_id      = var.vpc_id
  port        = lookup(var.target_groups[count.index], "backend_port", null)
  protocol    = lookup(var.target_groups[count.index], "backend_protocol", null) != null ? upper(lookup(var.target_groups[count.index], "backend_protocol")) : null
  target_type = lookup(var.target_groups[count.index], "target_type", null)

  deregistration_delay               = lookup(var.target_groups[count.index], "deregistration_delay", null)
  slow_start                         = lookup(var.target_groups[count.index], "slow_start", null)
  proxy_protocol_v2                  = lookup(var.target_groups[count.index], "proxy_protocol_v2", null)
  lambda_multi_value_headers_enabled = lookup(var.target_groups[count.index], "lambda_multi_value_headers_enabled", null)

  dynamic "health_check" {
    for_each = length(keys(lookup(var.target_groups[count.index], "health_check", {}))) == 0 ? [] : [
    lookup(var.target_groups[count.index], "health_check", {})]

    content {
      enabled             = lookup(health_check.value, "enabled", null)
      interval            = lookup(health_check.value, "interval", null)
      path                = lookup(health_check.value, "path", null)
      port                = lookup(health_check.value, "port", null)
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", null)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
      timeout             = lookup(health_check.value, "timeout", null)
      protocol            = lookup(health_check.value, "protocol", null)
      matcher             = lookup(health_check.value, "matcher", null)
    }
  }

  dynamic "stickiness" {
    for_each = length(keys(lookup(var.target_groups[count.index], "stickiness", {}))) == 0 ? [] : [lookup(var.target_groups[count.index], "stickiness", {})]

    content {
      enabled         = lookup(stickiness.value, "enabled", null)
      cookie_duration = lookup(stickiness.value, "cookie_duration", null)
      type            = lookup(stickiness.value, "type", null)
    }
  }

  tags = merge(
    var.tags,
    {
      "Name" = lookup(var.target_groups[count.index], "name", lookup(var.target_groups[count.index], "name_prefix", ""))
    },
  )

  depends_on = [aws_lb.this]

  lifecycle {
    create_before_destroy = true
  }
}

# Create HTTP listener
resource "aws_lb_listener" "frontend_http_tcp" {
  count = var.create_lb ? length(var.http_tcp_listeners) : 0

  load_balancer_arn = aws_lb.this[0].arn

  port     = var.http_tcp_listeners[count.index]["port"]
  protocol = var.http_tcp_listeners[count.index]["protocol"]

  default_action {
    type             = lookup(var.http_tcp_listeners[count.index], "type", "forward")
    target_group_arn = lookup(var.http_tcp_listeners[count.index], "target_group_index", null) != null ? aws_lb_target_group.main[lookup(var.http_tcp_listeners[count.index], "target_group_index", count.index)].id : null

    dynamic "fixed_response" {
      for_each = length(keys(lookup(var.http_tcp_listeners[count.index], "fixed_response", {}))) == 0 ? [] : [lookup(var.http_tcp_listeners[count.index], "fixed_response", {})]

      content {
        content_type = lookup(var.http_tcp_listeners[count.index].fixed_response, "content_type", null)
        message_body = lookup(var.http_tcp_listeners[count.index].fixed_response, "message_body", null)
        status_code  = lookup(var.http_tcp_listeners[count.index].fixed_response, "status_code", null)
      }
    }

    dynamic "redirect" {
      for_each = length(keys(lookup(var.http_tcp_listeners[count.index], "redirect", {}))) == 0 ? [] : [lookup(var.http_tcp_listeners[count.index], "redirect", {})]

      content {
        port        = lookup(var.http_tcp_listeners[count.index].redirect, "port", null)
        protocol    = lookup(var.http_tcp_listeners[count.index].redirect, "protocol", null)
        status_code = lookup(var.http_tcp_listeners[count.index].redirect, "status_code", null)
      }
    }
  }
}

# Create HTTPS listener
resource "aws_lb_listener" "frontend_https_tcp" {
  count             = var.create_lb ? length(var.https_tcp_listeners) : 0
  load_balancer_arn = aws_lb.this[0].arn
  port              = var.https_tcp_listeners[count.index]["port"]
  protocol          = lookup(var.https_tcp_listeners[count.index], "protocol", "HTTPS")
  certificate_arn   = var.https_tcp_listeners[count.index]["certificate_arn"]
  ssl_policy        = lookup(var.https_tcp_listeners[count.index], "ssl_policy", var.listener_ssl_policy_default)

  default_action {
    type             = lookup(var.https_tcp_listeners[count.index], "type", "forward")
    target_group_arn = lookup(var.https_tcp_listeners[count.index], "target_group_index", null) != null ? aws_lb_target_group.main[lookup(var.https_tcp_listeners[count.index], "target_group_index", count.index)].id : null

    dynamic "fixed_response" {
      for_each = length(keys(lookup(var.https_tcp_listeners[count.index], "fixed_response", {}))) == 0 ? [] : [lookup(var.https_tcp_listeners[count.index], "fixed_response", {})]

      content {
        content_type = lookup(var.https_tcp_listeners[count.index].fixed_response, "content_type", null)
        message_body = lookup(var.https_tcp_listeners[count.index].fixed_response, "message_body", null)
        status_code  = lookup(var.https_tcp_listeners[count.index].fixed_response, "status_code", null)
      }
    }

    dynamic "redirect" {
      for_each = length(keys(lookup(var.https_tcp_listeners[count.index], "redirect", {}))) == 0 ? [] : [lookup(var.https_tcp_listeners[count.index], "redirect", {})]

      content {
        port        = lookup(var.https_tcp_listeners[count.index].redirect, "port", null)
        protocol    = lookup(var.https_tcp_listeners[count.index].redirect, "protocol", null)
        status_code = lookup(var.https_tcp_listeners[count.index].redirect, "status_code", null)
      }
    }
  }
}

resource "aws_lb_listener_certificate" "https_listener" {
  count = var.create_lb ? length(var.extra_ssl_certs) : 0

  listener_arn    = aws_lb_listener.frontend_https_tcp[var.extra_ssl_certs[count.index]["https_listener_index"]].arn
  certificate_arn = var.extra_ssl_certs[count.index]["certificate_arn"]
}

# Create listener rules for HTTP listener
resource "aws_lb_listener_rule" "http_listener_rule" {
  count        = var.create_lb ? length(var.http_listener_rule) : 0
  listener_arn = aws_lb_listener.frontend_http_tcp[lookup(var.http_listener_rule[count.index], "listener_index", count.index)].arn
  priority     = var.http_listener_rule[count.index]["rule_priority"]

  action {
    type             = var.http_listener_rule[count.index]["type"]
    target_group_arn = aws_lb_target_group.main[lookup(var.http_listener_rule[count.index], "target_group_index", count.index)].arn
  }

  # Condition is mandatory, at least one needs to be met for rule to be applied
  dynamic "condition" {
    for_each = length(keys(lookup(var.http_listener_rule[count.index], "host_header_condition", {}))) == 0 ? [] : [lookup(var.http_listener_rule[count.index], "host_header_condition", {})]

    content {
      host_header {
        values = lookup(var.http_listener_rule[count.index].host_header_condition, "values", null)
      }
    }
  }

  dynamic "condition" {
    for_each = length(keys(lookup(var.http_listener_rule[count.index], "path_pattern_condition", {}))) == 0 ? [] : [lookup(var.http_listener_rule[count.index], "path_pattern_condition", {})]

    content {
      path_pattern {
        values = lookup(var.http_listener_rule[count.index].path_pattern_condition, "values", null)
      }
    }
  }
}

# Create listener rules for HTTPS listener
resource "aws_lb_listener_rule" "https_listener_rule" {
  count        = var.create_lb ? length(var.https_listener_rule) : 0
  listener_arn = aws_lb_listener.frontend_https_tcp[lookup(var.https_listener_rule[count.index], "listener_index", count.index)].arn
  priority     = var.https_listener_rule[count.index]["rule_priority"]

  action {
    type             = var.https_listener_rule[count.index]["type"]
    target_group_arn = aws_lb_target_group.main[lookup(var.https_listener_rule[count.index], "target_group_index", count.index)].arn
  }

  # Condition is mandatory, at least one needs to be met for rule to be applied
  dynamic "condition" {
    for_each = length(keys(lookup(var.https_listener_rule[count.index], "host_header_condition", {}))) == 0 ? [] : [lookup(var.https_listener_rule[count.index], "host_header_condition", {})]

    content {
      host_header {
        values = lookup(var.https_listener_rule[count.index].host_header_condition, "values", null)
      }
    }
  }

  dynamic "condition" {
    for_each = length(keys(lookup(var.https_listener_rule[count.index], "path_pattern_condition", {}))) == 0 ? [] : [lookup(var.https_listener_rule[count.index], "path_pattern_condition", {})]

    content {
      path_pattern {
        values = lookup(var.https_listener_rule[count.index].path_pattern_condition, "values", null)
      }
    }
  }
}

# Create target group attachment. This is used only for standalone ALB setups.
# If ECS is used then load_balancer is used to attach service to target group
resource "aws_lb_target_group_attachment" "target_group_attachment" {
  count             = var.create_lb ? length(var.target_group_attachment) : 0
  target_group_arn  = aws_lb_target_group.main[lookup(var.target_group_attachment[count.index], "target_group_index", count.index)].id
  target_id         = var.target_group_attachment[count.index]["target_id"]
  port              = var.target_group_attachment[count.index]["port"]
  availability_zone = var.target_group_attachment[count.index]["availability_zone"]
}
