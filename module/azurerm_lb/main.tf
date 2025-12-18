resource "azurerm_public_ip" "a_pip" {
  name                = "pip-web-01"
  location            = "CentralIndia"
  resource_group_name = "shashirg"
  allocation_method   = "Static"
}

resource "azurerm_lb" "a_lb" {
  name                = "AppLoadBalancer"
  location            = "CentralIndia"
  resource_group_name = "shashirg"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.a_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
<<<<<<< HEAD
  loadbalancer_id = azurerm_lb.a_lb.id
=======
  loadbalancer_id = azurerm_lb.lb.id
>>>>>>> feature
  name            = "BackEndAddressPool"
}

# Health probe (HTTP on port 80)
<<<<<<< HEAD
# ab probe resource gp ka naam nahi diya jata wo lb se hi le lenge
resource "azurerm_lb_probe" "probe" {
  name                = "http-probe"
=======
resource "azurerm_lb_probe" "probe" {
 name                = "http-probe"
  resource_group_name = "shashirg"
>>>>>>> feature
  loadbalancer_id     = azurerm_lb.a_lb.id
  protocol            = "Http"
  request_path        = "/"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}

# IP and Port based Routing
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.a_lb.id
  name                           = "NetflixRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
<<<<<<< HEAD
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
=======
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool1.id]
>>>>>>> feature
  probe_id                       = azurerm_lb_probe.probe.id
}
