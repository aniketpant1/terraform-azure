output "resource_name"{
value=module.resource.resource-group_name
}
output "virtual_network_name"{
value=module.network.network-name
}
output "subnet_name"{
value=module.network.subnet-name
}
output "nic_name"{
value=module.network.nic-name
}
output "public_ip_name"{
value=module.network.public-ip-name
}
output "public_ip_address"{
value=module.network.public-ip-address
}
output "network_ids"{
value=module.network.nic-ids
}
