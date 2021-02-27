resource "azurerm_network_security_group" "network_security_group_vnet1" {
    name        = var.nsg_name
    resource_group_name = local.resource_group_name
    location    = var.az_region
    security_rule = [ {
      access = "Allow"
      description = "Allow ssh"
      destination_address_prefix = "*"
      destination_address_prefixes = null
      destination_application_security_group_ids = null
      destination_port_range = "22"
      destination_port_ranges = null
      direction = "Inbound"
      name = "allow_ssh"
      priority = 100
      protocol = "Tcp"
      source_address_prefix = var.vnet_range
      source_address_prefixes = null
      source_application_security_group_ids = null
      source_port_range = "*"
      source_port_ranges = null
    } ]
    tags = {
      region = var.az_region
      environment = var.environment
      type = "nsg"
      resource_group = local.resource_group_name
    }
}