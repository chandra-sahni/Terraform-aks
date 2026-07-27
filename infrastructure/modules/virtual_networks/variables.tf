variable "virtual_networks" {
  type = map(object({
    name               = string
    address_space      = list(string)
    resource_group_key = string
    location           = string
    tags               = optional(map(string), {})
  }))
  description = "Custom virtual network definitions"
}

variable "resource_group_names" {
  type        = map(string)
  description = "Map of resource group names by key"
}
