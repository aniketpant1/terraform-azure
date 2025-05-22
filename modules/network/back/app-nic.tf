module "test" {
    source="/home/aniket/Azure-IAC/modules/resource"
    #source="./resource/"
}
output "module_resource_group111" {
  value = module.test.resource_group
}

#resource "azurerm_virtual_network" "app-network" {
#  name                = "app-vnet"
#  address_space       = ["10.0.0.0/16"]
#  location            = module.test.app-region
#  resource_group_name = module.test.resource_group
#  #depends_on = [module.test.resource_group]
#}
#
#
#resource "azurerm_subnet" "subA" {
#lifecycle {
#    create_before_destroy = true
#  }
#  name                 = "subnetA"
#  resource_group_name  = module.test.resource_group
#  virtual_network_name = "app-vnet"
#  address_prefixes     = ["10.0.2.0/24"]
#  #depends_on = [module.test.resource_group,azurerm_virtual_network.app-network]
#}
#
#resource "azurerm_network_interface" "app-network-interface" {
#  name                = "app-nic"
#  location            = module.test.app-region
#  resource_group_name = module.test.resource_group
#
#  ip_configuration {
#    name                          = "internal"
#    subnet_id                     = azurerm_subnet.subA.id
#    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id=azurerm_public_ip.app-pub-ip.id
#  }
#  #depends_on=[module.test.resource_group]
#}
#
#resource "azurerm_public_ip" "app-pub-ip" {
#  name                = "pub-ip"
#  resource_group_name = module.test.resource_group
#  location            = module.test.app-region
#  allocation_method   = "Static"
#  #depends_on =[module.test.resource_group] 
#}
#output "network-interface" {
#value=azurerm_network_interface.app-network-interface
#}
#
#output "virtual-network" {
#value=azurerm_virtual_network.app-network
#}
#
#
#output "subnets" {
#value=azurerm_subnet.subA
#}
