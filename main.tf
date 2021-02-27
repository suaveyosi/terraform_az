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

module "one_subnet" {
  source = "./one_subnet"

  resource_group = var.resource_group
  az_region = var.az_region
  environment = var.environment
  nsg_name = var.nsg_name
  vnet_name = var.vnet_name
  vnet_range = var.vnet_range
  subnet_name = var.subnet_name
  subnet_range = var.subnet_range
  vnet1_subnets = var.vnet1_subnets

}

## We can define more modules
# module "two_vnets" {
#
#}
