resource "azurerm_resource_group" "example" {
    name = local.resource_group_name # When accessing to local var we use .local
    location = var.az_region
    tags = {
      region = var.az_region
      environment = var.environment
      type = "rg"
      resource_group = local.resource_group_name
    }
}