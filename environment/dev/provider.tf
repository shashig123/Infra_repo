terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.53.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "todorg"
  #   storage_account_name = "todostg1234"
  #   container_name = "todostgcontainer"
  #   key = "dev.terraform.tfstate"
    
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "ff4b8dcc-265a-4fdf-9501-146b37e6ac66"
}