module "test" {

    source="/home/aniket/Azure-IAC/modules/resource"
}
module "test1" {
source = "/home/aniket/Azure-IAC/modules/network"
}
#resource "tls_private_key" "linux-key" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}
## creates file
#resource "local_file" "linuxpemkey" {
#  filename = "./linux.pem"
#  content  = tls_private_key.linux-key.private_key_pem
#  depends_on = [ tls_private_key.linux-key ]
#}
resource "azurerm_network_security_group" "nsg" {
  name                = "app-nsg"
  location            = module.test.app-region
  resource_group_name = module.test.resource_group.name

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
  subnet_id                 = module.test1.subnets.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = "ElasticVm"
  resource_group_name = module.test.resource_group.name
  location            = module.test.app-region
  size                = "Standard_D2_v4"
  admin_username      = "aniket"
  network_interface_ids = [
    module.test1.network-interface.id
  ]

  admin_ssh_key {
    username   = "aniket"
    public_key = file("/home/aniket/azure.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "87-gen2"
    version   = "latest"
  }
}

