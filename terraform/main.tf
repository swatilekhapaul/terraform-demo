data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "testrgexample" {
  name     = "testRG"
  location = "westeurope"
}
