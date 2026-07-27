output "virtual_network_ids" {
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.id }
  description = "Virtual network IDs"
}

output "virtual_network_names" {
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.name }
  description = "Virtual network names"
}
