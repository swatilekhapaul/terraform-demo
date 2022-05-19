terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-github"
    storage_account_name = "tfstpocgit001"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}