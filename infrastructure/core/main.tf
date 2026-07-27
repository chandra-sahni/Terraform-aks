module "resource_groups" {
  source = "../modules/resource_groups"

  resource_groups = var.resource_groups
}

module "virtual_networks" {
  source = "../modules/virtual_networks"

  virtual_networks    = var.virtual_networks
  resource_group_names = module.resource_groups.resource_group_names
}

module "subnets" {
  source = "../modules/subnets"

  subnets             = var.subnets
  virtual_network_names = module.virtual_networks.virtual_network_names
  resource_group_names  = module.resource_groups.resource_group_names
}

module "kubernetes_clusters" {
  source = "../modules/kubernetes_cluster"

  kubernetes_clusters    = var.kubernetes_clusters
  resource_group_names    = module.resource_groups.resource_group_names
  resource_group_locations = module.resource_groups.resource_group_locations
  subnet_ids             = module.subnets.subnet_ids

  depends_on = [module.subnets]
}