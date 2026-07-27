output "kubernetes_clusters" {
  value       = azurerm_kubernetes_cluster.aks
  description = "Created AKS cluster details"
  sensitive   = false
}

output "kubernetes_cluster_ids" {
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.id }
  description = "AKS cluster IDs"
}

output "kubernetes_cluster_names" {
  value       = { for k, v in azurerm_kubernetes_cluster.aks : k => v.name }
  description = "AKS cluster names"
}
