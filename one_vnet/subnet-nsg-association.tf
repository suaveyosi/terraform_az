# To associate a subnet with a nsg we have to use their ids
resource "azurerm_subnet_network_security_group_association" "nsg-association"{
    for_each = var.vnet1_subnets
    # As we have created different subnets with for each clause we have to access each one of them also here
    subnet_id                 = azurerm_subnet.subnets_vnet1[each.key].id
    network_security_group_id = azurerm_network_security_group.network_security_group_vnet1.id
    depends_on = [ azurerm_network_security_group.network_security_group_vnet1, azurerm_subnet.subnets_vnet1 ]

}