variable "vm" {
  type = map(object(

    {
      nsg_name            = string
      nic_name            = string
      resource_group_name = string
      location            = string
      vnet_name           = string
      subnet_name         = string
      pip_name            = string
      vm_name             = string
      size                = string
      # kv_name             = string
      admin_username      = string
      admin_password      = string
      # secret_user         = string
      # secret_pass         = string



      os_disk = object({
        name                 = string
        caching              = string
        storage_account_type = string
      })


  }))
}


