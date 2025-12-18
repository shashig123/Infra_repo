

resource "azurerm_bastion_host" "todobastion" {
  name                = "Todobastion"
  location            = "CentralIndia"
  resource_group_name = "shashirg"

  ip_configuration {
    name                 = "bastionIp"
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}