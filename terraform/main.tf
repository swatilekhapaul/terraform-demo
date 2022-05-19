data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "testrg" {
  name     = "testRG"
  location = "westeurope"
}