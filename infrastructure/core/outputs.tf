output "resource_groups" {
  value       = module.resource_groups.resource_group_names
  description = "Created resource group names"
}

output "aks_clusters" {
  value       = module.kubernetes_clusters.kubernetes_cluster_names
  description = "AKS cluster names"
}

output "aks_cluster_ids" {
  value       = module.kubernetes_clusters.kubernetes_cluster_ids
  description = "AKS cluster IDs"
}
