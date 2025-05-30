resource "aws_budgets_budget" "my_budget" {
  name              = var.budget_name
  budget_type       = "COST"
  limit_amount      = var.daily_cost_limit
  limit_unit        = "USD"
  time_period_start = var.time_period_start
  time_period_end   = var.time_period_end
  time_unit         = var.time_unit

  # Percentage change threshold
  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = var.percentage_change_threshold
    threshold_type            = "PERCENTAGE"
    notification_type         = "ACTUAL"
    subscriber_sns_topic_arns = [aws_sns_topic.alerts.arn]
  }

  # Absolute dollar change threshold
  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = var.absolute_change_threshold
    threshold_type            = "ABSOLUTE_VALUE"
    notification_type         = "ACTUAL"
    subscriber_sns_topic_arns = [aws_sns_topic.alerts.arn]
  }
}
