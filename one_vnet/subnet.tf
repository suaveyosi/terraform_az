## Create multiple subnets
resource "azurerm_subnet" "subnets_vnet1"{
    for_each = var.vnet1_subnets 
    name    = each.key
    address_prefixes = [each.value]
    resource_group_name = local.resource_group_name
    virtual_network_name = var.vnet_name

    depends_on = [ azurerm_resource_group.example, azurerm_network_security_group.network_security_group_vnet1, azurerm_virtual_network.vnet1 ]
}
