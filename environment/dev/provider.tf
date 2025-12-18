terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.53.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "todorg"
  #   storage_account_name = "todostg"
  #   container_name = "todocontainer"
  #   key = "dev.terraform.tfstate"
    
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "73db7a9a-aef7-41fe-8a49-10610ce568af"
}