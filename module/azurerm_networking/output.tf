output "vnets" {
description = "Map of created VNets with their IDs and names."
value = {
for k, v in azurerm_virtual_network.vnet : k => {
id = v.id
name = v.name
}
}
}


output "subnets" {
description = "Map of maps: vnet_key -> subnet_name -> subnet id (best-effort)."
value = {
for vkey, v in azurerm_virtual_network.vnet : vkey => {
for s in v.subnet : s.name => s.id
}
}
}