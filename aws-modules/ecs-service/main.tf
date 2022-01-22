### Setup ECS service
resource "aws_ecs_service" "ignore_changes_task_definition" {
  count                              = var.enabled && var.ignore_changes_task_definition ? 1 : 0
  name                               = "${var.name}-service"
  task_definition                    = "${join("", aws_ecs_task_definition.default.*.family)}:${join("", aws_ecs_task_definition.default.*.revision)}"
  desired_count                      = var.desired_count
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  launch_type                        = length(var.launch_type) == 0 ? null : var.launch_type
  platform_version                   = var.launch_type == "FARGATE" ? var.platform_version : null
  scheduling_strategy                = var.scheduling_strategy

  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      registry_arn   = service_registries.value.registry_arn
      port           = lookup(service_registries.value, "port", null)
      container_name = lookup(service_registries.value, "container_name", null)
      container_port = lookup(service_registries.value, "container_port", null)
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = var.ordered_placement_strategy
    content {
      type  = ordered_placement_strategy.value.type
      field = lookup(ordered_placement_strategy.value, "field", null)
    }
  }

  dynamic "placement_constraints" {
    for_each = var.service_placement_constraints
    content {
      type       = placement_constraints.value.type
      expression = lookup(placement_constraints.value, "expression", null)
    }
  }

  dynamic "load_balancer" {
    for_each = var.ecs_load_balancers
    content {
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
      elb_name         = lookup(load_balancer.value, "elb_name", null)
      target_group_arn = lookup(load_balancer.value, "target_group_arn", null)
    }
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = lookup(capacity_provider_strategy.value, "capacity_provider", null)
      weight            = lookup(capacity_provider_strategy.value, "capacity_provider_weight", null)
    }
  }

  cluster        = var.ecs_cluster_arn
  propagate_tags = var.propagate_tags
  # The new ARN and resource ID format must be enabled to add tags to the service.
  # Opt in to the new format and try again
  #tags           = var.tags

  deployment_controller {
    type = var.deployment_controller_type
  }

  # https://www.terraform.io/docs/providers/aws/r/ecs_service.html#network_configuration
  dynamic "network_configuration" {
    for_each = var.network_mode == "awsvpc" ? ["true"] : []
    content {
      security_groups  = var.security_group_ids
      subnets          = var.subnet_ids
      assign_public_ip = var.assign_public_ip
    }
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_service" "default" {
  count                              = var.enabled && var.ignore_changes_task_definition == false ? 1 : 0
  name                               = "${var.name}-service"
  task_definition                    = "${join("", aws_ecs_task_definition.default.*.family)}:${join("", aws_ecs_task_definition.default.*.revision)}"
  desired_count                      = var.desired_count
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  health_check_grace_period_seconds  = var.health_check_grace_period_seconds
  launch_type                        = length(var.launch_type) == 0 ? null : var.launch_type
  platform_version                   = var.launch_type == "FARGATE" ? var.platform_version : null
  scheduling_strategy                = var.scheduling_strategy

  dynamic "service_registries" {
    for_each = var.service_registries
    content {
      registry_arn   = service_registries.value.registry_arn
      port           = lookup(service_registries.value, "port", null)
      container_name = lookup(service_registries.value, "container_name", null)
      container_port = lookup(service_registries.value, "container_port", null)
    }
  }

  dynamic "ordered_placement_strategy" {
    for_each = var.ordered_placement_strategy
    content {
      type  = ordered_placement_strategy.value.type
      field = lookup(ordered_placement_strategy.value, "field", null)
    }
  }

  dynamic "placement_constraints" {
    for_each = var.service_placement_constraints
    content {
      type       = placement_constraints.value.type
      expression = lookup(placement_constraints.value, "expression", null)
    }
  }

  dynamic "load_balancer" {
    for_each = var.ecs_load_balancers
    content {
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
      elb_name         = lookup(load_balancer.value, "elb_name", null)
      target_group_arn = lookup(load_balancer.value, "target_group_arn", null)
    }
  }

  dynamic "capacity_provider_strategy" {
    for_each = var.capacity_provider_strategy
    content {
      capacity_provider = lookup(capacity_provider_strategy.value, "capacity_provider", null)
      weight            = lookup(capacity_provider_strategy.value, "capacity_provider_weight", null)
    }
  }

  cluster        = var.ecs_cluster_arn
  propagate_tags = var.propagate_tags
  # The new ARN and resource ID format must be enabled to add tags to the service.
  # Opt in to the new format and try again
  #tags           = var.tags

  deployment_controller {
    type = var.deployment_controller_type
  }

  # https://www.terraform.io/docs/providers/aws/r/ecs_service.html#network_configuration
  dynamic "network_configuration" {
    for_each = var.network_mode == "awsvpc" ? ["true"] : []
    content {
      security_groups  = var.security_group_ids
      subnets          = var.subnet_ids
      assign_public_ip = var.assign_public_ip
    }
  }
}
