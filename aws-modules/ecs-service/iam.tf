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
  name               = "${module.label.id}-service"
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
  name   = format("%s-%s-%s", var.namespace, var.environment, var.name)
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
  name               = "${module.label.id}-exec"
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
  name   = "${module.label.id}-exec"
  policy = join("", data.aws_iam_policy_document.ecs_exec.*.json)
  role   = join("", aws_iam_role.ecs_exec.*.id)
}

# SSM access for services (all services read parameters from AWS SSM)
data "aws_iam_policy_document" "ssm_access" {
  count = var.enabled ? 1 : 0

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ssm:GetParameterHistory",
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter"
    ]
  }
}

# SSM is needed both during boot of a service (exec) and later when it's working (task)
resource "aws_iam_role_policy" "ssm_task_access" {
  count  = var.enabled ? 1 : 0
  name   = "${module.label.id}-ssm-task-access"
  policy = join("", data.aws_iam_policy_document.ssm_access.*.json)
  role   = join("", aws_iam_role.ecs_task.*.id)
}

resource "aws_iam_role_policy" "ssm_exec_access" {
  count  = var.enabled ? 1 : 0
  name   = "${module.label.id}-ssm-exec-access"
  policy = join("", data.aws_iam_policy_document.ssm_access.*.json)
  role   = join("", aws_iam_role.ecs_exec.*.id)
}

# Setup additional access for task role
data "aws_iam_policy_document" "custom_task_permissions" {
  count = var.enabled && var.custom_task_policy_enabled ? 1 : 0
  dynamic "statement" {
    for_each = var.custom_task_policy_statement
    content {
      sid       = ""
      actions   = lookup(statement.value, "actions", [])
      effect    = lookup(statement.value, "effect", "Allow")
      resources = lookup(statement.value, "resources", ["*"])
    }
  }
}

resource "aws_iam_role_policy" "custom_task_access" {
  count  = var.enabled && var.custom_task_policy_enabled ? 1 : 0
  name   = "${module.label.id}-custom-task-access"
  policy = join("", data.aws_iam_policy_document.custom_task_permissions.*.json)
  role   = join("", aws_iam_role.ecs_task.*.id)
}

# Setup additional access for exec role
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
  name   = "${module.label.id}-custom-exec-access"
  policy = join("", data.aws_iam_policy_document.custom_exec_permissions.*.json)
  role   = join("", aws_iam_role.ecs_exec.*.id)
}
