# output "stg_id" {
#     # value = azurerm_storage_account.stg.ids
#     value ={for k ,stg in azurerm_resource_group.storage_accounts :k => stg.id}
  
# }