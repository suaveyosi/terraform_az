resource "azurerm_resource_group" "example" {
    name = local.resource_group_name # When accessing to local var we use .local
    location = var.az_region
}