resource "azurerm_network_security_group" "network_security_group_vnet1" {
    name        = var.nsg_name
    resource_group_name = local.resource_group_name
    location    = var.az_region
    security_rule = [ {
      access = "Allow"
      description = "Allow ssh"
      destination_address_prefix = "*"
      destination_address_prefixes = [ "*" ]
      destination_application_security_group_ids = [ "*" ]
      destination_port_range = "22"
      destination_port_ranges = [ "22" ]
      direction = "Inbound"
      name = "allow_ssh"
      priority = 100
      protocol = "Tcp"
      source_address_prefix = "*"
      source_address_prefixes = [ "*" ]
      source_application_security_group_ids = [ "*" ]
      source_port_range = "*"
      source_port_ranges = [ "*" ]
    } ]
}