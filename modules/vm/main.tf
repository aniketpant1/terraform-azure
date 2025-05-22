resource "azurerm_linux_virtual_machine" "linux-vm" {
  count = var.number_of_instances
  name                = "ElasticVm-${count.index}"
  resource_group_name = var.resource_name
  location            = var.app-region
  size                = "Standard_D2_v4"
  admin_username      = "aniket"
  network_interface_ids = [
    var.network-ids
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

