#------------------------------------------------------------------------------
# Variables that need to be set
#------------------------------------------------------------------------------
variable "resource_group" {
  description = "Name of the resource group to create"
  type        = string

}
variable "az_region" {
  description = "The Azure region to work in"
  type        = string
}

variable "environment" {
  description = "The name of the environment that we want to update"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string 
}

variable "vnet_name" {
  description = "VNET name"
  type        = string
}

variable "vnet_range" {
  description = "VNET ip range"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_range" {
  description = "Subnet range"
  type        = string
}

variable "vnet1_subnets" {
  description = "Dictionary with all subnets"
  type        = map
  default     = {}
}