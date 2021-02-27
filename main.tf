terraform {
  required_version = ">= 0.12.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "one_vnet" {
  source = "./one_vnet"

  resource_group = var.resource_group
  az_region = var.az_region
  environment = var.environment
  nsg_name = var.nsg_name
  vnet_name = var.vnet_name
  vnet_range = var.vnet_range
  vnet1_subnets = var.vnet1_subnets
  machine_size = var.machine_size
  admin_user = var.admin_user
  admin_pass = var.admin_pass

}

## We can define more modules
# module "two_vnets" {
#
#}
