resource "azurerm_virtual_network" "vnet1" {
    name        = var.vnet_name
    resource_group_name = local.resource_group_name
    location    = azurerm_resource_group.example.location
    address_space = [ var.vnet_range ]
#    subnet {
#        for_each = [ vnet1_subnets ]
#        name    = "${each.key}"
#        address_prefix = "${each.value}"
#        security_group = var.nsg_name
#    }

    depends_on = [ azurerm_resource_group.example, azurerm_network_security_group.network_security_group_vnet1 ]
    tags = {
      region = var.az_region
      environment = var.environment
      type = "vnet"
      resource_group = local.resource_group_name
    }
}