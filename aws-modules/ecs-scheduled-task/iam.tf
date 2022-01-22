# IAM permissions needed for this service
data "aws_iam_policy_document" "ecs_task" {
  count = var.enabled ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task" {
  count              = var.enabled ? 1 : 0
  name               = "${module.label.id}-task"
  assume_role_policy = join("", data.aws_iam_policy_document.ecs_task.*.json)
  tags               = var.tags
}

data "aws_iam_policy_document" "ecs_service" {
  count = var.enabled ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_service" {
  count              = var.enabled ? 1 : 0
  name               = "${var.name}-service"
  assume_role_policy = join("", data.aws_iam_policy_document.ecs_service.*.json)
  tags               = var.tags
}

data "aws_iam_policy_document" "ecs_service_policy" {
  count = var.enabled ? 1 : 0

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "ec2:Describe*",
      "ec2:AuthorizeSecurityGroupIngress"
    ]
  }
}

resource "aws_iam_role_policy" "ecs_service" {
  count  = var.enabled ? 1 : 0
  name   = var.name
  policy = join("", data.aws_iam_policy_document.ecs_service_policy.*.json)
  role   = join("", aws_iam_role.ecs_service.*.id)
}

# IAM role that the Amazon ECS container agent and the Docker daemon can assume
data "aws_iam_policy_document" "ecs_task_exec" {
  count = var.enabled ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_exec" {
  count              = var.enabled ? 1 : 0
  name               = "${var.name}-exec"
  assume_role_policy = join("", data.aws_iam_policy_document.ecs_task_exec.*.json)
  tags               = var.tags
}

data "aws_iam_policy_document" "ecs_exec" {
  count = var.enabled ? 1 : 0

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
  }
}

resource "aws_iam_role_policy" "ecs_exec" {
  count  = var.enabled ? 1 : 0
  name   = "${var.name}-exec"
  policy = join("", data.aws_iam_policy_document.ecs_exec.*.json)
  role   = join("", aws_iam_role.ecs_exec.*.id)
}

# Setup custom permissions for exec role
data "aws_iam_policy_document" "custom_exec_permissions" {
  count = var.enabled && var.custom_exec_policy_enabled ? 1 : 0
  dynamic "statement" {
    for_each = var.custom_exec_policy_statement
    content {
      sid       = ""
      actions   = lookup(statement.value, "actions", [])
      effect    = lookup(statement.value, "effect", "Allow")
      resources = lookup(statement.value, "resources", ["*"])
    }
  }
}

resource "aws_iam_role_policy" "custom_exec_access" {
  count  = var.enabled && var.custom_exec_policy_enabled ? 1 : 0
  name   = "${var.name}-custom-exec-access"
  policy = join("", data.aws_iam_policy_document.custom_exec_permissions.*.json)
  role   = join("", aws_iam_role.ecs_exec.*.id)
}
