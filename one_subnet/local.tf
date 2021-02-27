locals {
   resource_group_name = join("", [upper(var.environment), "_",var.resource_group]) 
}