output "resource-group_name"{
value=azurerm_linux_virtual_machine.linux-vm[*].resource_group_name
}

output "resource-location"{
value=azurerm_linux_virtual_machine.linux-vm[*].location
#azurerm_linux_virtual_machine.linux-vm[count.index]
}
