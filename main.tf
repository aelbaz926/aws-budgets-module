module "budget_alerts" {
  source = "./modules/aws-budget-alert"

  budget_name                = "cloud-budget"
  daily_cost_limit           = "1000"
  percentage_change_threshold = 5
  absolute_change_threshold  = 100
  email_recipients           = ["ahmed.ali.elbaz.mohamed@gmail.com"]
}
