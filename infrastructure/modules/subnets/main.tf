resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = var.resource_group_names[each.value.resource_group_key]
  virtual_network_name = var.virtual_network_names[each.value.virtual_network_key]
  address_prefixes     = [each.value.address_prefix]

  service_endpoints = each.value.service_endpoints
}
