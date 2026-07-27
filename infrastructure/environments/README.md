# Environment Structure

This repository uses a segregated environment structure for managing Terraform configurations across multiple environments.

## Folder Layout

```
infrastructure/
├── core/                            # Shared Terraform code and module orchestration
│   ├── main.tf                      # Infrastructure code (uses modules)
│   ├── variables.tf                 # Input variable definitions
│   ├── outputs.tf                   # Output values
│   ├── provider.tf                  # Provider configuration
│   └── terraform.tfvars             # Core template values
├── modules/                         # Shared Terraform modules
│   ├── resource_groups/
│   ├── kubernetes_cluster/
│   ├── subnets/
│   └── virtual_networks/
└── environments/
    ├── dev/                         # Development environment
    │   ├── backend.tf                # Dev backend config (separate state)
    │   └── terraform.tfvars          # Dev-specific values
    ├── prod/                        # Production environment
    │   ├── backend.tf                # Prod backend config (separate state)
    │   └── terraform.tfvars          # Prod-specific values
    ├── qa/                          # QA environment
    │   ├── backend.tf                # QA backend config (separate state)
    │   └── terraform.tfvars          # QA-specific values
    └── staging/                     # Staging environment
        ├── backend.tf               # Staging backend config (separate state)
        └── terraform.tfvars         # Staging-specific values
```

## How to Use

All shared Terraform code is in the `infrastructure/core/` folder. Each environment folder contains only:
- `backend.tf` - Specifies where state is stored for that environment
- `terraform.tfvars` - Environment-specific variable values

### Deploying to an Environment

1. Navigate to the core directory:
   ```bash
   cd infrastructure/core
   ```

2. Initialize Terraform for the chosen environment:
   ```bash
   terraform init -backend-config=../environments/dev/backend.tf  # for dev
   terraform init -backend-config=../environments/prod/backend.tf # for prod
   ```

3. Plan or Apply:
   ```bash
   terraform plan -var-file=../environments/dev/terraform.tfvars  # for dev
   terraform apply -var-file=../environments/dev/terraform.tfvars # for dev
   ```

### Switching Between Environments

Each environment uses a separate backend state file, so you can work on multiple environments independently.

## Benefits

- **DRY Principle**: Infrastructure code is defined once in `infrastructure/core/`
- **Env Segregation**: Each environment has separate state files and values
- **Easy to Scale**: Adding a new environment only requires adding `backend.tf` and `terraform.tfvars`
- **Clear Separation**: Easy to see what differs between environments

## Example Environment Values

- **Dev**: 1 node, Standard_D2s_v3 VM
- **QA**: 2 nodes, Standard_D2s_v3 VM
- **Staging**: 2 nodes, Standard_D2s_v3 VM
- **Prod**: 3 nodes, Standard_D4s_v3 VM
