###############################
#   Azure Authentication
###############################

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "rg-name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-ci"
}

variable "rg-location" {
  description = "Resource Group Location"
  type        = string
  default     = "Central India"
}