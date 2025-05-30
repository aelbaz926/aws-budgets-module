variable "region" {
  description = "AWS region for the budget."
  type        = string
  default     = "us-east-1"
}

variable "budget_name" {
  description = "The name of the budget."
  type        = string
  default     = "cloud-budget"
}

variable "time_unit" {
  description = "Budget time unit (DAILY, MONTHLY, QUARTERLY, or ANNUALLY)."
  type        = string
  default     = "DAILY"
}

variable "time_period_start" {
  description = "Budget start date (e.g., 2024-12-30_00:00)."
  type        = string
  default     = "2024-12-30_00:00"
}

variable "time_period_end" {
  description = "Budget end date."
  type        = string
  default     = "2029-12-30_00:00"
}

variable "daily_cost_limit" {
  description = "Daily cost limit for the budget."
  type        = string
  default     = "1000"
}

variable "percentage_change_threshold" {
  description = "Percentage change threshold."
  type        = number
  default     = 5
}

variable "absolute_change_threshold" {
  description = "Absolute dollar change threshold."
  type        = number
  default     = 100
}

variable "email_recipients" {
  description = "List of email addresses for budget alerts."
  type        = list(string)
}
