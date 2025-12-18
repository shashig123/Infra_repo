
# data "azurerm_key_vault" "key_vault" {
#   for_each            = var.vm
#   name                = each.value.kv_name
#   resource_group_name = each.value.resource_group_name
# }
# data "azurerm_key_vault_secret" "vm_username" {
#   for_each     = var.vm
#   name         = each.value.secret_user
#   key_vault_id = data.azurerm_key_vault.key_vault[each.key].id

# }
# data "azurerm_key_vault_secret" "vm_password" {
#   for_each     = var.vm
#   name         = each.value.secret_pass
#   key_vault_id = data.azurerm_key_vault.key_vault[each.key].id

# }
data "azurerm_network_interface" "nic_data" {
  for_each            = var.vm
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_network_security_group" "nsg_data" {
  for_each            = var.vm
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}
