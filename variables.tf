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
variable "vnet1_subnets" {
  description = "Dictionary with all subnets"
  type        = map
  default     = {}
}

variable "machine_size" {
  description = "Size of the VM"
  type = string
  default = "DS1_v2"
}

variable "admin_user" {
  description = "Admin user to control machines"
  type = string
  default = "adminuser"
}

variable "admin_pass" {
  description = "Admin pass to admin user"
  type = string
  default = "QA_T3st_123."
}