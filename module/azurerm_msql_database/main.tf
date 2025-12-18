data "azurerm_mssql_server" "server_id" {
  name                = "todo-sqlserver"
  resource_group_name = "shashirg"
}
resource "azurerm_mssql_database" "database" {
  for_each = var.database
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.server_id.id
  collation    = each.value.collation
  license_type = each.value.license_type
  # max_size_gb  = 2
  # sku_name     = "S0"
  # enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }
}