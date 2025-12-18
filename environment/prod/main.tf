module "resouce" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs

}
# ==============================
module "network" {
  depends_on = [module.resouce]
  source     = "../../module/azurerm_networking"
  vnets      = var.vnets
}
# ===========================
module "nic_nsg" {
  depends_on = [module.resouce, module.nic_app, module.pip]
  source     = "../../module/azurerm_nsg"
  nsg        = var.nsg
}
# =========================
module "nic_app" {
  depends_on = [module.resouce, module.pip, module.network]
  source     = "../../module/nic"
  nic        = var.nic
}
# ========================

module "pip" {
  depends_on = [module.network, module.resouce]
  source     = "../../module/azurerm_pip"
  public_ips = var.public_ips
}
# ============================
module "linux_vms" {
  depends_on = [module.network, module.resouce,
    module.k_vault,
  # module.azurerm_key_vault_secret 
  module.nic_nsg, module.nic_app]


  source = "../../module/azurerm_vm" # your module path
  vm     = var.vm

}

module "k_vault" {
  depends_on = [module.resouce]
  source     = "../../module/azurerm_kv"
  kv         = var.kv
}

# module "azurerm_key_vault_secret" {
#   depends_on       = [module.k_vault]
#   source           = "../../module/azurerm_key_secret"
#   key_vault_secret = var.key_vault_secret
# }

# ========================== 
module "server" {
  depends_on = [ module.resouce ]
  source = "../../module/azurerm_msql_server"
  msql_server=var.msql_server
  # inputs...
}
# # -----------------------------
module "data_base" {
  depends_on = [ module.server ]
  source = "../../module/azurerm_msql_database"
   # this creates implicit dependency
  database = var.database
}
# ======================aks

