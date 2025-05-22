variable "resource_name" {
description = "Create resouce group"
type=string
default="app-grp"
}
variable "app-region" {
description = "Location of app resource"
type=string
default="Central India"
}
variable "app_net"{
description="virtual network name"
type=string
default="app-net"
}
variable "app_nic"{
description="network interface name"
type=string
default="app-nic"
}
variable "public_ip"{
description="assign public ip"
type=string
default="pub-ip"
}
variable "app-nsg"{
description="network security group"
type=string
default="app-nsg"
}

