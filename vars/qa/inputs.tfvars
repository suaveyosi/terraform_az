#------------------------------------------------------------------------------
# Project Variables
#------------------------------------------------------------------------------
resource_group="rg_one_vnet"

az_region = "westeurope"

nsg_name = "nsg_vnet1"
vnet_name = "vnet1"
vnet_range = "10.0.0.0/16"

vnet1_subnets = {
    subnet1 = "10.0.1.0/24"
    subnet2 = "10.0.2.0/24"
    subnet3 = "10.0.3.0/24"
}

