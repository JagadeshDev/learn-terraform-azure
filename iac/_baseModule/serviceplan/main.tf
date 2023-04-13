data "azurerm_resource_group" "TerraformRg" {
  name = "myTFResourceGroup"
}

resource "azurerm_service_plan" "FunctionPlan" {
  location            = data.azurerm_resource_group.TerraformRg.location
  name                = "FunctionPlan"
  os_type             = "Linux"
  resource_group_name = data.azurerm_resource_group.TerraformRg.name
  sku_name            = "B1"
}