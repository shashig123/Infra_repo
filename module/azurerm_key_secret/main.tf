
data "azurerm_key_vault" "kv" {
  for_each            = var.key_vault_secret # ye bhi nahi lagaya
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.key_vault_secret # ye nahi lagata
  name         = each.value.secret_name
  value        = each.value.secret_value
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

