resource "azurerm_virtual_network" "vnet1" {
    name        = var.vnet_name
    resource_group_name = local.resource_group_name
    location    = azurerm_resource_group.example.location
    address_space = [ var.vnet_range ]
    subnet {
        name    = var.subnet_name
        address_prefix = var.subnet_range
        security_group = var.nsg_name
    }

    depends_on = [ azurerm_resource_group.example, azurerm_network_security_group.network_security_group_vnet1 ]
}