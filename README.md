# Terraform AWS Budget Alert Module

This Terraform module provisions an **AWS Budget** with alerts for both **percentage change** and **absolute dollar change** thresholds. Alerts are sent to an **SNS topic** with email subscriptions, making it easy to track cost fluctuations in your AWS environment.

---

## 📦 Features

✅ **AWS Budgets**:
- Tracks cost limits (daily, monthly, etc.).
- Alerts on:
  - **Percentage change threshold** (e.g., 5%).
  - **Absolute dollar change threshold** (e.g., $100).

✅ **SNS Topic**:
- Receives alerts from AWS Budgets.
- Email notifications sent to a list of recipients.

---

## ⚙️ Usage

Here’s a basic example of how to use this module in your Terraform project:

```hcl
module "budget_alerts" {
  source = "./modules/aws-budget-alert"

  budget_name                 = "my-daily-budget"
  daily_cost_limit            = "1000"
  percentage_change_threshold = 5
  absolute_change_threshold   = 100
  email_recipients            = ["you@example.com", "team@example.com"]
}
