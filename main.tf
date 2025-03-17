terraform {
    required_version = ">=1.3.7"
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.43.0"
      }
    } 
    cloud { 
    
    organization = "duff_stuff" 

    workspaces { 
      name = "TerraformCI" 
    } 
  } 
}

provider "azurerm" {
    features {}
    skip_provider_registration = true  
}
resource "azurerm_resource_group" "rg" {
    location = "East US 2"
    name = "rg-tf-01"
}

resource "azurerm_storage_account" "storage" {
    name = "stgacctrgtf01"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    account_tier = "Standard"
    account_replication_type = "LRS"
}