resource "azurerm_linux_virtual_machine" "vm_block" {
  for_each = var.vm

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  # admin_username                  = data.azurerm_key_vault_secret.vm_username[each.key].value
  # admin_password                  = data.azurerm_key_vault_secret.vm_password[each.key].value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.nic_data[each.key].id]

  os_disk {
    name                 = each.value.os_disk.name
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}



resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each                  = var.vm
  network_interface_id      = data.azurerm_network_interface.nic_data[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data[each.key].id
}
