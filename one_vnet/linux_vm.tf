# In this file we will create one machine in each subnet
# Create one nic in each subnet
resource "azurerm_network_interface" "nics" {
    for_each = var.vnet1_subnets
    name = "${var.environment}_nic_${each.key}"
    location = var.az_region
    resource_group_name = local.resource_group_name
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.subnets_vnet1[each.key].id
      private_ip_address_allocation = "Dynamic"
    }
    depends_on = [ azurerm_subnet.subnets_vnet1 ]

}

# Create vm
resource "azurerm_linux_virtual_machine" "example" {
    for_each = var.vnet1_subnets
    name = "machine_${each.key}"
    location = var.az_region
    resource_group_name = local.resource_group_name
    size = var.machine_size
    admin_username = var.admin_user
    admin_password = var.admin_pass
    # NIC
    network_interface_ids = [ azurerm_network_interface.nics[each.key].id ]
    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"
    }    
    depends_on = [ azurerm_network_interface.nics ]
}