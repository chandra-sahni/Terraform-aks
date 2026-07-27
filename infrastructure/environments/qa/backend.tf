terraform {
  backend "azurerm" {
    resource_group_name  = "rg-ci"
    storage_account_name = "stgbackendci"
    container_name       = "tfstate"
    key                  = "qa.terraform.tfstate"
  }
}
