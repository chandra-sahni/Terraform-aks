variable "kubernetes_clusters" {
  type = map(object({
    name               = string
    dns_prefix         = string
    node_pool_name     = string
    node_count         = number
    vm_size            = string
    tags               = map(string)
    resource_group_key = string
    subnet_key         = string
  }))
  description = "Kubernetes cluster definitions"
}

variable "resource_group_names" {
  type        = map(string)
  description = "Map of resource group names by key"
}

variable "resource_group_locations" {
  type        = map(string)
  description = "Map of resource group locations by key"
}

variable "subnet_ids" {
  type        = map(string)
  description = "Map of subnet IDs by key"
}
