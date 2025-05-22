output "resource-group_name"{
value=azurerm_virtual_network.app-network.resource_group_name
}

output "resource-location"{
value=azurerm_virtual_network.app-network.location
}
output "network-name"{
value=azurerm_virtual_network.app-network.name
}
output "subnet-name"{
value=azurerm_subnet.subA.name
}
output "nic-name"{
value=azurerm_network_interface.app-network-interface.name
}
output "nic-ids"{
value=azurerm_network_interface.app-network-interface.id
}
output "public-ip-name"{
value=azurerm_public_ip.app-pub-ip.name
}
output "public-ip-address"{
description="Public IP"
value=azurerm_public_ip.app-pub-ip.ip_address
}
output "network-security-group-name"{
value=azurerm_network_security_group.nsg.name
}
output "network-security-group-association-nsglink"{
value=azurerm_subnet_network_security_group_association.nsglink
}
