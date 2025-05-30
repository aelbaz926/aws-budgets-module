data "aws_caller_identity" "current" {}

resource "aws_sns_topic" "alerts" {
  name = "${var.budget_name}-alerts-topic"
}

# SNS Topic Policy for Budgets to publish alerts
resource "aws_sns_topic_policy" "alerts_policy" {
  arn    = aws_sns_topic.alerts.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    sid       = "AllowBudgetPublishing"
    effect    = "Allow"
    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }
    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.alerts.arn]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = ["arn:aws:budgets::${data.aws_caller_identity.current.account_id}:*"]
    }
  }
}

# Email subscriptions to the SNS topic
resource "aws_sns_topic_subscription" "email_subscriptions" {
  count     = length(var.email_recipients)
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.email_recipients[count.index]
}
