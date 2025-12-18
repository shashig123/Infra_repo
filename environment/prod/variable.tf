variable "rgs" {}

#========================================
variable "vnets" {}
#====================================
variable "public_ips" {}
#==============================Nsg
variable "nsg" {}
#=======================vm
variable "vm" {}
#=======================
variable "kv" {}
#==========================
variable "msql_server" {}
#=========================
variable "database" {}
# ?==================nic
variable "nic" {

}
# variable "key_vault_secret" {
#   type = map(object({
#     key_vault_name      = string
#     resource_group_name = string
#     secret_name         = string
#     secret_value        = string
#   }))
# }
  