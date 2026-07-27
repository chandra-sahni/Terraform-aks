output "subnet_ids" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.id }
  description = "Subnet IDs"
}

output "subnet_names" {
  value       = { for k, s in azurerm_subnet.subnet : k => s.name }
  description = "Subnet names"
}
