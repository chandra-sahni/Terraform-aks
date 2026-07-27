resource_groups = {
  example = {
    name     = "example-resources-qa"
    location = "West Europe"
    tags = {
      Environment = "QA"
      ManagedBy   = "Terraform"
    }
  }
}

kubernetes_cluster = {
  name           = "example-aks-qa"
  dns_prefix     = "exampleaks-qa"
  node_pool_name = "default"
  node_count     = 2
  vm_size        = "Standard_D2s_v3"
  tags = {
    Environment = "QA"
    ManagedBy   = "Terraform"
  }
}

primary_rg = "example"
