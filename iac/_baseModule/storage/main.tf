data "azurerm_resource_group" "TerraformRg" {
  name = "myTFResourceGroup"
}

# create a storage account
resource "azurerm_storage_account" "NotificationStorage" {
  name                     = "jaggutest123"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = data.azurerm_resource_group.TerraformRg.location
  resource_group_name      = data.azurerm_resource_group.TerraformRg.name
  tags = {
    Env = "Dev"
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}