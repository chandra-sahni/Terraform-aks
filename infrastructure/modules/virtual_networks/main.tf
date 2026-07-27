resource "azurerm_virtual_network" "vnet" {
  for_each = var.virtual_networks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.resource_group_names[each.value.resource_group_key]
  address_space       = each.value.address_space
  tags                = each.value.tags
}
