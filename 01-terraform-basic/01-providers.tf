terraform {
  required_providers {

# azurerm providers   
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.113.0"
    }
  

# azuread providers
    azuread = {
      source = "hashicorp/azuread"
      version = "2.53.1"
    }


# random providers
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }

 }

# remote backend for state file
   
    backend "azurerm" {
    resource_group_name  = var.rg_name  # 
    storage_account_name = "${var.project_name}-storage_acc"                      # 
    container_name       = "${var.project_name}-container"                       # 
    key                  = "prod.terraform.tfstate"        # 
 
  }

}

# configuration for azurerm

provider "azurerm" {
     features {}
}

