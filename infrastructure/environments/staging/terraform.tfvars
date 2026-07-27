resource_groups = {
  example = {
    name     = "example-resources-staging"
    location = "West Europe"
    tags = {
      Environment = "Staging"
      ManagedBy   = "Terraform"
    }
  }
}

kubernetes_cluster = {
  name           = "example-aks-staging"
  dns_prefix     = "exampleaks-staging"
  node_pool_name = "default"
  node_count     = 2
  vm_size        = "Standard_D2s_v3"
  tags = {
    Environment = "Staging"
    ManagedBy   = "Terraform"
  }
}

primary_rg = "example"
