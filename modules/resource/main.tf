resource "azurerm_resource_group" "app_resource_group" {
# lifecycle {
#    create_before_destroy = true
#  }
 name     = var.resource_name
 location = var.app-region
}

