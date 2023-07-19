# manged_subsribe
![Variable structure](/var_structure.png?raw=true "Vars structure")

```
terraform plan
module.mangmet_groups_second_level["Prod"].data.azurerm_management_group.mangment_group_id: Reading...
module.mangmet_groups_second_level["Non_Prod"].data.azurerm_management_group.mangment_group_id: Reading...
module.mangmet_groups_second_level["SandBox"].data.azurerm_management_group.mangment_group_id: Reading...

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform planned the following actions, but then encountered a problem:

  # module.mangmet_groups_first_level["Exporatory"].azurerm_management_group.mgmt_group will be created
  + resource "azurerm_management_group" "mgmt_group" {
      + display_name               = "Exporatory"
      + group_id                   = (known after apply)
      + id                         = (known after apply)
      + name                       = "Exporatory"
      + parent_management_group_id = (known after apply)
      + subscription_ids           = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].azurerm_management_group.mgmt_group will be created
  + resource "azurerm_management_group" "mgmt_group" {
      + display_name               = "Platform_T_S"
      + group_id                   = (known after apply)
      + id                         = (known after apply)
      + name                       = "Platform_T_S"
      + parent_management_group_id = (known after apply)
      + subscription_ids           = (known after apply)
    }

  # module.mangmet_groups_first_level["Policy_staging"].azurerm_management_group.mgmt_group will be created
  + resource "azurerm_management_group" "mgmt_group" {
      + display_name               = "Policy_staging"
      + group_id                   = (known after apply)
      + id                         = (known after apply)
      + name                       = "Policy_staging"
      + parent_management_group_id = (known after apply)
      + subscription_ids           = (known after apply)
    }

  # module.mangmet_groups_first_level["Suspended"].azurerm_management_group.mgmt_group will be created
  + resource "azurerm_management_group" "mgmt_group" {
      + display_name               = "Suspended"
      + group_id                   = (known after apply)
      + id                         = (known after apply)
      + name                       = "Suspended"
      + parent_management_group_id = (known after apply)
      + subscription_ids           = (known after apply)
    }

  # module.mangmet_groups_first_level["Workload"].azurerm_management_group.mgmt_group will be created
  + resource "azurerm_management_group" "mgmt_group" {
      + display_name               = "Workload"
      + group_id                   = (known after apply)
      + id                         = (known after apply)
      + name                       = "Workload"
      + parent_management_group_id = (known after apply)
      + subscription_ids           = (known after apply)
    }

  # module.mangmet_groups_first_level["Exporatory"].module.policy["Policy26"].azurerm_management_group_policy_assignment.example will be created
  + resource "azurerm_management_group_policy_assignment" "example" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy26-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Exporatory"].module.policy["Policy26"].azurerm_policy_definition.example will be created
  + resource "azurerm_policy_definition" "example" {
      + display_name          = "Policy26"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = (known after apply)
      + mode                  = "All"
      + name                  = "Policy26"
      + policy_rule           = jsonencode(
            {
              + something = "something"
            }
        )
      + policy_type           = "Custom"
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.policy["Policy1"].azurerm_management_group_policy_assignment.example will be created
  + resource "azurerm_management_group_policy_assignment" "example" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy1-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.policy["Policy1"].azurerm_policy_definition.example will be created
  + resource "azurerm_policy_definition" "example" {
      + display_name          = "Policy1"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = (known after apply)
      + mode                  = "All"
      + name                  = "Policy1"
      + policy_rule           = jsonencode(
            {
              + something = "something"
            }
        )
      + policy_type           = "Custom"
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_NonProd"].azurerm_management_group_subscription_association.this will be created
  + resource "azurerm_management_group_subscription_association" "this" {
      + id                  = (known after apply)
      + management_group_id = (known after apply)
      + subscription_id     = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_NonProd"].azurerm_subscription.this will be created
  + resource "azurerm_subscription" "this" {
      + alias             = (known after apply)
      + id                = (known after apply)
      + subscription_id   = (known after apply)
      + subscription_name = "Platform_NonProd"
      + tenant_id         = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_NonProd"].random_uuid.this will be created
  + resource "random_uuid" "this" {
      + id     = (known after apply)
      + result = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_Prod"].azurerm_management_group_subscription_association.this will be created
  + resource "azurerm_management_group_subscription_association" "this" {
      + id                  = (known after apply)
      + management_group_id = (known after apply)
      + subscription_id     = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_Prod"].azurerm_subscription.this will be created
  + resource "azurerm_subscription" "this" {
      + alias             = (known after apply)
      + id                = (known after apply)
      + subscription_id   = (known after apply)
      + subscription_name = "Platform_Prod"
      + tenant_id         = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_Prod"].random_uuid.this will be created
  + resource "random_uuid" "this" {
      + id     = (known after apply)
      + result = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_Sandbox"].azurerm_management_group_subscription_association.this will be created
  + resource "azurerm_management_group_subscription_association" "this" {
      + id                  = (known after apply)
      + management_group_id = (known after apply)
      + subscription_id     = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_Sandbox"].azurerm_subscription.this will be created
  + resource "azurerm_subscription" "this" {
      + alias             = (known after apply)
      + id                = (known after apply)
      + subscription_id   = (known after apply)
      + subscription_name = "Platform_Sandbox"
      + tenant_id         = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.subscrption["Platform_Sandbox"].random_uuid.this will be created
  + resource "random_uuid" "this" {
      + id     = (known after apply)
      + result = (known after apply)
    }

  # module.mangmet_groups_first_level["Policy_staging"].module.policy["Policy24"].azurerm_management_group_policy_assignment.example will be created
  + resource "azurerm_management_group_policy_assignment" "example" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy24-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Policy_staging"].module.policy["Policy24"].azurerm_policy_definition.example will be created
  + resource "azurerm_policy_definition" "example" {
      + display_name          = "Policy24"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = (known after apply)
      + mode                  = "All"
      + name                  = "Policy24"
      + policy_rule           = jsonencode(
            {
              + something = "something"
            }
        )
      + policy_type           = "Custom"
    }

  # module.mangmet_groups_first_level["Suspended"].module.policy["Policy25"].azurerm_management_group_policy_assignment.example will be created
  + resource "azurerm_management_group_policy_assignment" "example" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy25-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Suspended"].module.policy["Policy25"].azurerm_policy_definition.example will be created
  + resource "azurerm_policy_definition" "example" {
      + display_name          = "Policy25"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = (known after apply)
      + mode                  = "All"
      + name                  = "Policy25"
      + policy_rule           = jsonencode(
            {
              + something = "something"
            }
        )
      + policy_type           = "Custom"
    }

  # module.mangmet_groups_first_level["Workload"].module.policy["Policy23"].azurerm_management_group_policy_assignment.example will be created
  + resource "azurerm_management_group_policy_assignment" "example" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy23-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Workload"].module.policy["Policy23"].azurerm_policy_definition.example will be created
  + resource "azurerm_policy_definition" "example" {
      + display_name          = "Policy23"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = (known after apply)
      + mode                  = "All"
      + name                  = "Policy23"
      + policy_rule           = jsonencode(
            {
              + something = "something"
            }
        )
      + policy_type           = "Custom"
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["Commercial"].azurerm_subscription.this will be created
  + resource "azurerm_subscription" "this" {
      + alias             = (known after apply)
      + id                = (known after apply)
      + subscription_id   = (known after apply)
      + subscription_name = "Commercial"
      + tenant_id         = (known after apply)
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["Commercial"].random_uuid.this will be created
  + resource "random_uuid" "this" {
      + id     = (known after apply)
      + result = (known after apply)
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["Corporate"].azurerm_subscription.this will be created
  + resource "azurerm_subscription" "this" {
      + alias             = (known after apply)
      + id                = (known after apply)
      + subscription_id   = (known after apply)
      + subscription_name = "Corporate"
      + tenant_id         = (known after apply)
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["Corporate"].random_uuid.this will be created
  + resource "random_uuid" "this" {
      + id     = (known after apply)
      + result = (known after apply)
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["R_&_D"].azurerm_subscription.this will be created
  + resource "azurerm_subscription" "this" {
      + alias             = (known after apply)
      + id                = (known after apply)
      + subscription_id   = (known after apply)
      + subscription_name = "R_&_D"
      + tenant_id         = (known after apply)
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["R_&_D"].random_uuid.this will be created
  + resource "random_uuid" "this" {
      + id     = (known after apply)
      + result = (known after apply)
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["Supply_Chain"].azurerm_subscription.this will be created
  + resource "azurerm_subscription" "this" {
      + alias             = (known after apply)
      + id                = (known after apply)
      + subscription_id   = (known after apply)
      + subscription_name = "Supply_Chain"
      + tenant_id         = (known after apply)
    }

  # module.mangmet_groups_second_level["Non_Prod"].module.subscrption["Supply_Chain"].random_uuid.this will be created
  + resource "random_uuid" "this" {
      + id     = (known after apply)
      + result = (known after apply)
    }

Plan: 32 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + local = {
      + Non_Prod = {
          + parrent_name  = "Workload"
          + subscriptions = [
              + "R_&_D",
              + "Supply_Chain",
              + "Commercial",
              + "Corporate",
            ]
        }
      + Prod     = {
          + parrent_name  = "Workload"
          + subscriptions = []
        }
      + SandBox  = {
          + parrent_name  = "Workload"
          + subscriptions = []
        }
    }
╷
│ Error: Management Group "Workload" was not found
│
│   with module.mangmet_groups_second_level["Non_Prod"].data.azurerm_management_group.mangment_group_id,
│   on modules/mangment_groups_parrent/data.tf line 1, in data "azurerm_management_group" "mangment_group_id":
│    1: data "azurerm_management_group" "mangment_group_id" {
│
╵
╷
│ Error: Management Group "Workload" was not found
│
│   with module.mangmet_groups_second_level["Prod"].data.azurerm_management_group.mangment_group_id,
│   on modules/mangment_groups_parrent/data.tf line 1, in data "azurerm_management_group" "mangment_group_id":
│    1: data "azurerm_management_group" "mangment_group_id" {
│
╵
╷
│ Error: Management Group "Workload" was not found
│
│   with module.mangmet_groups_second_level["SandBox"].data.azurerm_management_group.mangment_group_id,
│   on modules/mangment_groups_parrent/data.tf line 1, in data "azurerm_management_group" "mangment_group_id":
│    1: data "azurerm_management_group" "mangment_group_id" {
│
╵
```