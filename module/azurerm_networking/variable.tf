variable "vnets" {
    type= map(object(
    {
        name= string
        location=string
        resource_group_name= string
        address_space       = list(string)
        tags                = optional(map(string))
        sub_nets            =optional( map(object(
            {
                name = string
                address_prefixes = list(string)
            }
        )) )
    }
    ))

  
}
# variable "vnets" {
#   description = "Map of virtual networks to create."
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     address_space       = list(string)

#     tags                = optional(map(string))
# #agr subnet ki value map ne pass krte hai to map(object)
#     sub_nets = optional(map(object({
#       name                                          = string
#       address_prefixes                              = list(string)
# #agr subnet ki value list ne pass krte hai to list(object)
#     # sub_nets = optional(list(object({
#     #   name                                          = string
#     #   address_prefixes                              = list(string)

                       
#     })))
#   }))
# }
