data "azurerm_resource_group" "TerraformRg" {
  name = "myTFResourceGroup"
}

data "azurerm_service_plan" "ServicePlan" {
  name = "FunctionPlan"
  resource_group_name = data.azurerm_resource_group.TerraformRg.name
}

data "azurerm_storage_account" "Storage" {
  name = "jaggutest123"
  resource_group_name = data.azurerm_resource_group.TerraformRg.name
}

resource "azurerm_linux_function_app" "NotiFunc" {
  location                    = data.azurerm_resource_group.TerraformRg.location
  service_plan_id             = data.azurerm_service_plan.ServicePlan.id
  resource_group_name         = data.azurerm_resource_group.TerraformRg.name
  name                        = "NotiFunc"
  functions_extension_version = "~4"
  https_only                  = true
  site_config {
    always_on = true
    application_stack {
      dotnet_version              = "6.0"
      use_dotnet_isolated_runtime = true
    }
    http2_enabled = true
  }
  storage_account_access_key = data.azurerm_storage_account.Storage.primary_access_key
  storage_account_name       = data.azurerm_storage_account.Storage.name

}