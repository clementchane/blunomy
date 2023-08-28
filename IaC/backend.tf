terraform {
  backend "azurerm" {
    resource_group_name  = "dev-ops"
    storage_account_name = "ztdevtfbackend"
    container_name       = "tfstate"
    key                  = "aksinfra.tfstate"
  }
}