resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.kubernetes_clusters

  name                = each.value.name
  location            = var.resource_group_locations[each.value.resource_group_key]
  resource_group_name = var.resource_group_names[each.value.resource_group_key]
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name           = each.value.node_pool_name
    node_count     = each.value.node_count
    vm_size        = each.value.vm_size
    vnet_subnet_id = var.subnet_ids[each.value.subnet_key]
  }

  identity {
    type = "SystemAssigned"
  }

  tags = each.value.tags
}
