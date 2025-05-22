module "test" {
    source="D:/terraform_practicals/terraform-begins/modules/resource"
}

resource "azurerm_storage_account" "app-storage" {
  name                = "appstorage786aki"
  resource_group_name = "app_grp"
  location                 = module.test.app-region
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "staging"
  }
  depends_on = [module.test.resource_group]
}
resource "azurerm_storage_container" "app-container" {
  name                  = "logs-container"
  storage_account_id   = azurerm_storage_account.app-storage.id
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.app-storage]
}

resource "azurerm_storage_blob" "app-blob" {
  name                   = "terraform-files"
  storage_account_name   = "appstorage786aki"
  storage_container_name = "logs-container"
  type                   = "Block"
  source                 = "/home/aniket/Azure-IAC/terraform.log"
  depends_on            = [azurerm_storage_account.app-storage,azurerm_storage_container.app-container]
  
}
