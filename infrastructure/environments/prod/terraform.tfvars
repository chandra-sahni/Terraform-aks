resource_groups = {
  example = {
    name     = "example-resources-prod"
    location = "West Europe"
    tags = {
      Environment = "Production"
      ManagedBy   = "Terraform"
    }
  }
}

kubernetes_cluster = {
  name           = "example-aks-prod"
  dns_prefix     = "exampleaks-prod"
  node_pool_name = "default"
  node_count     = 3
  vm_size        = "Standard_D4s_v3"
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}

primary_rg = "example"
