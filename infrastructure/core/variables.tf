variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  description = "Enterprise resource groups configuration"
}

variable "virtual_networks" {
  type = map(object({
    name              = string
    address_space     = list(string)
    resource_group_key = string
    location          = string
    tags              = optional(map(string), {})
  }))
  description = "Custom virtual network configurations"
}

variable "subnets" {
  type = map(object({
    name              = string
    address_prefix    = string
    virtual_network_key = string
    resource_group_key = string
    service_endpoints = optional(list(string), [])
    tags              = optional(map(string), {})
  }))
  description = "Custom subnet configurations"
}

variable "kubernetes_clusters" {
  type = map(object({
    name              = string
    dns_prefix        = string
    node_pool_name    = string
    node_count        = number
    vm_size           = string
    tags              = map(string)
    resource_group_key = string
    subnet_key        = string
  }))
  description = "Kubernetes cluster configurations"
}