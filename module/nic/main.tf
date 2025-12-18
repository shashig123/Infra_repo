resource "azurerm_network_interface" "nicvm" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {

    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"# in static cate private ip address should be specified
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}
