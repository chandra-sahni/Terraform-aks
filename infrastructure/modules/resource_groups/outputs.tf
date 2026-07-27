output "resource_group_ids" {
  value       = { for k, rg in azurerm_resource_group.rg : k => rg.id }
  description = "Resource group IDs"
}

output "resource_group_names" {
  value       = { for k, rg in azurerm_resource_group.rg : k => rg.name }
  description = "Resource group names"
}

output "resource_group_locations" {
  value       = { for k, rg in azurerm_resource_group.rg : k => rg.location }
  description = "Resource group locations"
}
