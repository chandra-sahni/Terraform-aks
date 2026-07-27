variable "subnets" {
  type = map(object({
    name                = string
    address_prefix      = string
    virtual_network_key = string
    resource_group_key  = string
    service_endpoints   = optional(list(string), [])
    tags                = optional(map(string), {})
  }))
  description = "Custom subnet definitions"
}

variable "virtual_network_names" {
  type        = map(string)
  description = "Map of virtual network names by key"
}

variable "resource_group_names" {
  type        = map(string)
  description = "Map of resource group names by key"
}
