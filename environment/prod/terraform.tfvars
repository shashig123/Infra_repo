rgs = {
  rg1 = {
    name       = "prod-rg"
    location   = "CentralIndia"
    managed_by = "pg1 ka malik"
    tags = {
      business_unit = "dimmy"
      cost_center   = "2345"
    }
  }
}
#=========================================
vnets = {
  vnet1 = {
    name                = "prod-vnet1"
    location            = "CentralIndia"
    resource_group_name = "prod-rg"
    address_space       = ["10.0.0.0/16"]
    tags                = {}
    # value map me pass kr rahe hai
    sub_nets = {
      s1 = {
        name             = "frontend_subnet1"
        address_prefixes = ["10.0.1.0/24"]
      }
      s2 = {
        name             = "backend_subnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
    # value list me pass kr rahe hai
    # sub_nets = [
    # {
    # name = "frotend_subnet1"
    # address_prefixes = ["10.0.1.0/24"]
    # }
    # ,
    # {
    # name = "backend_subnet1"
    # address_prefixes = ["10.0.2.0/24"]
    # }

    # ]

  }
}
#=========================================
public_ips = {
  pip1 = {
    name                = "prod-pip-web-01"
    resource_group_name = "prod-rg"
    location            = "CentralIndia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "prod-pip-web-02"
    resource_group_name = "prod-rg"
    location            = "CentralIndia"
    allocation_method   = "Static"
  }
  # ip recreation due to zone and domain name label
}
# =========================NIC
nic = {
  nic1 = {
    nic_name            = "prod-frontend-nic"
    location            = "CentralIndia"
    resource_group_name = "prod-rg"
    vnet_name           = "prod-vnet1"
    subnet_name         = "frontend_subnet1"
    pip_name            = "prod-pip-web-01"


  }
  nic2 = {
    nic_name            = "prod-backend-nic"
    location            = "CentralIndia"
    resource_group_name = "prod-rg"
    vnet_name           = "prod-vnet1"
    subnet_name         = "backend_subnet2"
    pip_name            = "prod-pip-web-02"

  }

}
# ===========================NSG
nsg = {
  nsg1 = {
    name                = "frontend-nsg"
    location            = "CentralIndia"
    resource_group_name = "prod-rg"
    security_rule = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  nsg2 = {
    name                = "backend-nsg"
    location            = "CentralIndia"
    resource_group_name = "prod-rg"
    security_rule = [
      {
        name                       = "allow-ssh"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}
#=======================================VM code with nic



vm = {
  vm1 = {
    nsg_name            = "frontend-nsg"
    nic_name            = "prod-frontend-nic"
    resource_group_name = "prod-rg"
    location            = "CentralIndia"
    vnet_name           = "prod-vnet1"
    subnet_name         = "frontend_subnet1"
    pip_name            = "prod-pip-web-01"
    vm_name             = "prod-frontendvm"
    kv_name             = "shashikitijori123"
    admin_username      = "adminuser"
    admin_password      = "shashi@123"
    # secret_user         = "username"
    # secret_pass         = "password"
    size                = "Standard_B1s"


    os_disk = {
      name                 = "pg1-vm1-osdisk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"

    }

  }

  vm2 = {
    nsg_name            = "backend-nsg"
    nic_name            = "prod-backend-nic"
    resource_group_name = "prod-rg"
    location            = "CentralIndia"
    vnet_name           = "prod-vnet1"
    subnet_name         = "backend_subnet2"
    pip_name            = "prod-pip-web-02"
    vm_name             = "prod-backendvm"
    size                = "Standard_B1s"

    kv_name             = "shashikitijori123"
    admin_username      = "adminuser"
    admin_password      = "shashi@123"
    # secret_user         = "username"
    # secret_pass         = "password"


    os_disk = {
      name                 = "pg1-vm2-osdisk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
  }
}
#=========================KV code
kv = {
  key_vault = {
    name                        = "shashikitijori123"
    location                    = "CentralIndia"
    resource_group_name         = "prod-rg"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false

    sku_name = "standard"

  }
}




# ===========================Msql_Server
msql_server = {
  sql = {

    name                         = "todo-sqlserver"
    resource_group_name          = "prod-rg"
    location                     = "CentralIndia"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "Shashi@1234"

    tags = {
      environment = "production"
    }
  }

}
# ======================================== mssql-database

database = {
  sql_database = {
    name         = "backend-database"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"

  }
}
# ================================

# key_vault_secret = {
#   kvs1 = {
#     key_vault_name      = "todokvshshi1"
#     resource_group_name = "shashirg"
#     secret_name         = "username"
#     secret_value        = "adminuser"
#   }
#   kvs2 = {
#     key_vault_name      = "todokvshshi1"
#     resource_group_name = "shashirg"
#     secret_name         = "password"
#     secret_value        = "password@123@!"
#   }
# -------------------------AKs
aks={
  aks1={
  name                = "todoaks"
  location            = "CentralIndia"
  resource_group_name = "prod-rg"

  }
}
 