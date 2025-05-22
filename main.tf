terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
   features {}
  subscription_id   = "xxxxxxx"
  tenant_id         = "xxxxxxx"
  client_id         = "xxxxxxx"
  client_secret     = "xxxxxxx"
}
module "resource" {
  source="./modules/resource"

}
module "network" {
  source="./modules/network"
  depends_on=[module.resource.resource-group_name]
}
module "vm" {
  source="./modules/vm"
  network-ids=module.network.nic-ids
}
