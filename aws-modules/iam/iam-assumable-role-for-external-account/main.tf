data "aws_iam_policy_document" "assume_role" {
  statement {
    sid     = "AllowAssumeRoleForAnotherAccount"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.trusted_role_arns
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.external_id]
    }
  }
}

resource "aws_iam_role" "this" {
  count                 = var.create_role ? 1 : 0
  name                  = var.role_name
  path                  = var.role_path
  description           = var.role_description
  assume_role_policy    = data.aws_iam_policy_document.assume_role.json
  permissions_boundary  = var.role_permissions_boundary_arn
  force_detach_policies = var.role_force_detach_policies
  max_session_duration  = var.role_max_session_duration
  tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "custom" {
  count      = var.create_role && length(var.custom_role_policy_arns) > 0 ? length(var.custom_role_policy_arns) : 0
  role       = aws_iam_role.this[0].name
  policy_arn = element(var.custom_role_policy_arns, count.index)
}
