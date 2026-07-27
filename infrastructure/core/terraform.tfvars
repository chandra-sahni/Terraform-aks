resource_groups = {
  enterprise = {
    name     = "rg-enterprise-aks-dev"
    location = "westeurope"
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
      Project     = "aks-poc"
    }
  }
}

virtual_networks = {
  dev_vnet = {
    name               = "vnet-enterprise-aks-dev"
    address_space      = ["10.0.0.0/16"]
    resource_group_key = "enterprise"
    location           = "westeurope"
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
    }
  }
}

subnets = {
  aks_subnet = {
    name               = "snet-aks-dev"
    address_prefix     = "10.0.1.0/24"
    virtual_network_key = "dev_vnet"
    resource_group_key  = "enterprise"
    service_endpoints  = ["Microsoft.Storage", "Microsoft.Sql"]
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
    }
  }
}

kubernetes_clusters = {
  aks_dev = {
    name               = "aks-enterprise-dev"
    dns_prefix         = "aks-enterprise-dev"
    node_pool_name     = "agentpool"
    node_count         = 1
    vm_size            = "Standard_D2s_v3"
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
      Project     = "aks-poc"
    }
    resource_group_key = "enterprise"
    subnet_key         = "aks_subnet"
  }
}
