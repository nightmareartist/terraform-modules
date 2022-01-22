data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
}

# Cloudwatch event role
resource "aws_iam_role" "scheduled_task_cloudwatch" {
  name               = "${var.name}-cloudwatch-role"
  assume_role_policy = file("${path.module}/policies/scheduled-task-cloudwatch-assume-role-policy.json")
  tags               = var.tags
}

data "template_file" "scheduled_task_cloudwatch_policy" {
  template = file("${path.module}/policies/scheduled-task-cloudwatch-policy.json")

  vars = {
    cluster_name    = var.cluster_name
    account_id      = local.account_id
    task_def_family = aws_ecs_task_definition.scheduled_task.family
  }
}

resource "aws_iam_role_policy" "scheduled_task_cloudwatch_policy" {
  name   = "${var.name}-st-cloudwatch-policy"
  role   = aws_iam_role.scheduled_task_cloudwatch.id
  policy = data.template_file.scheduled_task_cloudwatch_policy.rendered

}

# ECS task definition
resource "aws_ecs_task_definition" "scheduled_task" {
  family                   = "${var.name}-scheduled-task"
  container_definitions    = module.container_definition.json
  requires_compatibilities = length(var.launch_type) == 0 ? null : [var.launch_type]
  network_mode             = var.network_mode
  execution_role_arn       = join("", aws_iam_role.ecs_exec.*.arn)
  task_role_arn            = join("", aws_iam_role.ecs_task.*.arn)
  cpu                      = var.cpu
  memory                   = var.memory
  tags                     = var.tags
}

# Cloudwatch event
resource "aws_cloudwatch_event_rule" "scheduled_task" {
  name                = "${var.name}-scheduled-task"
  description         = "Run ${var.name} task at a scheduled time."
  schedule_expression = var.schedule_expression
  tags                = var.tags
}

resource "aws_cloudwatch_event_target" "scheduled_task" {
  target_id = "${var.name}-scheduled-task-target"
  rule      = aws_cloudwatch_event_rule.scheduled_task.name
  arn       = var.cluster_arn
  role_arn  = aws_iam_role.scheduled_task_cloudwatch.arn

  ecs_target {
    task_count          = var.task_count
    task_definition_arn = aws_ecs_task_definition.scheduled_task.arn
    launch_type         = var.launch_type

    # Network configuration is needed only for awsvpc/Fargate
    dynamic "network_configuration" {
      for_each = var.network_mode == "awsvpc" ? ["true"] : []
      content {
        security_groups  = var.security_groups
        subnets          = var.subnets
        assign_public_ip = var.assign_public_ip
      }
    }
  }
}
