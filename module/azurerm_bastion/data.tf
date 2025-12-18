data "azurerm_subnet" "subnet" {
 
  name                 = "frontend_subnet1"
  virtual_network_name = "vnet1"
  resource_group_name  = "shashirg"
}

data "azurerm_public_ip" "pip" {

  name                = "pip-web-01"
  resource_group_name = "shashirg"
}
