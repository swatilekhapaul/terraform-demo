data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "testrgexample" {
  name     = "testRG"
  location = "westeurope"
}

resource "azurerm_storage_account" "example" {
  name                     = "tffuncapp001"
  resource_group_name      = azurerm_resource_group.testrgexample.name
  location                 = azurerm_resource_group.testrgexample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example" {
  name                = "azure-functions-test-service-plan"
  location            = azurerm_resource_group.testrgexample.location
  resource_group_name = azurerm_resource_group.testrgexample.name

  sku {
    tier = "WorkflowStandard"
    size = "WS1"
  }
}

resource "azurerm_logic_app_standard" "example" {
  name                       = "test-azure-functions"
  location                   = azurerm_resource_group.testrgexample.location
  resource_group_name        = azurerm_resource_group.testrgexample.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}