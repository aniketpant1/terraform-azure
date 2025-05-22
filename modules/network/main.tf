resource "azurerm_virtual_network" "app-network" {
  name                = var.app_net
  address_space       = ["10.0.0.0/16"]
  location            = var.app-region
  resource_group_name = var.resource_name
}


resource "azurerm_subnet" "subA" {
lifecycle {
    create_before_destroy = true
  }
  name                 = "subnetA"
  resource_group_name  = var.resource_name
  virtual_network_name = azurerm_virtual_network.app-network.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  #depends_on           =[var.resource_name,azurerm_virtual_network.app-network]
}

resource "azurerm_network_interface" "app-network-interface" {
  name                = var.app_nic
  location            = var.app-region
  resource_group_name = var.resource_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id=azurerm_public_ip.app-pub-ip.id
  }
}

resource "azurerm_public_ip" "app-pub-ip" {
  name                = var.public_ip
  resource_group_name = var.resource_name
  location            = var.app-region
  allocation_method   = "Static"
}
resource "azurerm_network_security_group" "nsg" {
  name                = var.app-nsg
  location            = var.app-region
  resource_group_name = var.resource_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "nsglink" {
  subnet_id                 = azurerm_subnet.subA.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
