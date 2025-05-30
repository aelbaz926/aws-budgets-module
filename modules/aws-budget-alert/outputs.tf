output "sns_topic_arn" {
  description = "ARN of the SNS topic for budget alerts."
  value       = aws_sns_topic.alerts.arn
}

output "budget_name" {
  description = "Name of the created AWS Budget."
  value       = aws_budgets_budget.my_budget.name
}
