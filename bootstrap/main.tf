resource "azurerm_resource_group" "tfstate-rg" {
  name     = var.rg-name
  location = var.rg-location
}

resource "azurerm_storage_account" "tfstate-stg" {
  name                     = "stgbackendci"
  resource_group_name      = azurerm_resource_group.tfstate-rg.name
  location                 = azurerm_resource_group.tfstate-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate-container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.tfstate-stg.id
  container_access_type = "private"
}