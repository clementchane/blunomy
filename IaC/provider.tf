terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.26.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias                         = "subname1"
  subscription_id = "#{subid}#"
  tenant_id              = "#{tenantid}#"
  client_id                = "#{clientid}#"
  client_secret      = "#{clientsecret}#"
  features {}
}

provider "azurerm" {
   features {}
}