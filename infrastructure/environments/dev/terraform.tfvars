resource_groups = {
  example = {
    name     = "example-resources"
    location = "West Europe"
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
    }
  }
}

virtual_networks = {
  example_vnet = {
    name               = "vnet-enterprise-aks-dev"
    address_space      = ["10.0.0.0/16"]
    resource_group_key = "example"
    location           = "West Europe"
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
    }
  }
}

subnets = {
  example_subnet = {
    name               = "snet-aks-dev"
    address_prefix     = "10.0.1.0/24"
    virtual_network_key = "example_vnet"
    resource_group_key  = "example"
    service_endpoints  = ["Microsoft.Storage", "Microsoft.Sql"]
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
    }
  }
}

kubernetes_clusters = {
  example_aks = {
    name               = "aks-enterprise-dev"
    dns_prefix         = "aks-enterprise-dev"
    node_pool_name     = "default"
    node_count         = 1
    vm_size            = "Standard_D2s_v3"
    tags = {
      Environment = "Development"
      ManagedBy   = "Terraform"
    }
    resource_group_key = "example"
    subnet_key         = "example_subnet"
  }
}

