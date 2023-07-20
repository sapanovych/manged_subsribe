# manged_subsribe
![Variable structure](/var_structure.png?raw=true "Vars structure")

```
terraform plan
module.mangmet_groups_second_level["Prod"].data.azurerm_management_group.mangment_group_id: Reading...
module.mangmet_groups_second_level["SandBox"].data.azurerm_management_group.mangment_group_id: Reading...
module.mangmet_groups_second_level["Non_Prod"].data.azurerm_management_group.mangment_group_id: Reading...

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

  # module.mangmet_groups_first_level["Exporatory"].module.policy["Policy26"].azurerm_management_group_policy_assignment.this[0] will be created
  + resource "azurerm_management_group_policy_assignment" "this" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy26-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Exporatory"].module.policy["Policy26"].azurerm_policy_definition.this will be created
  + resource "azurerm_policy_definition" "this" {
      + description           = "Enforce backup for all virtual machines by backing them up to an existing central recovery services vault in the same location and subscription as the virtual machine. Doing this is useful when there is a central team in your organization managing backups for all resources in a subscription. You can optionally include virtual machines containing a specified tag to control the scope of assignment. See https://aka.ms/AzureVMCentralBackupIncludeTag."
      + display_name          = "Configure backup on virtual machines with a given tag to an existing recovery services vault in the same location"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = jsonencode(
            {
              + category = "Backup"
              + version  = "9.1.0"
            }
        )
      + mode                  = "Indexed"
      + name                  = "Policy26"
      + parameters            = jsonencode(
            {
              + backupPolicyId    = {
                  + metadata = {
                      + description = "Specify the ID of the Azure Backup policy to configure backup of the virtual machines. The selected Azure Backup policy should be of type Azure Virtual Machine. This policy needs to be in a vault that is present in the location chosen above. For example - /subscriptions/<SubscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.RecoveryServices/vaults/<VaultName>/backupPolicies/<BackupPolicyName>"
                      + displayName = "Backup Policy (of type Azure VM from a vault in the location chosen above)"
                      + strongType  = "Microsoft.RecoveryServices/vaults/backupPolicies"
                    }
                  + type     = "String"
                }
              + effect            = {
                  + allowedValues = [
                      + "auditIfNotExists",
                      + "AuditIfNotExists",
                      + "deployIfNotExists",
                      + "DeployIfNotExists",
                      + "disabled",
                      + "Disabled",
                    ]
                  + defaultValue  = "DeployIfNotExists"
                  + metadata      = {
                      + description = "Enable or disable the execution of the policy"
                      + displayName = "Effect"
                    }
                  + type          = "String"
                }
              + inclusionTagName  = {
                  + defaultValue = ""
                  + metadata     = {
                      + description = "Name of the tag to use for including VMs in the scope of this policy. This should be used along with the Inclusion Tag Value parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy"
                      + displayName = "Inclusion Tag Name"
                    }
                  + type         = "String"
                }
              + inclusionTagValue = {
                  + metadata = {
                      + description = "Value of the tag to use for including VMs in the scope of this policy (in case of multiple values, use a comma-separated list). This should be used along with the Inclusion Tag Name parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy."
                      + displayName = "Inclusion Tag Values"
                    }
                  + type     = "Array"
                }
              + vaultLocation     = {
                  + metadata = {
                      + description = "Specify the location of the VMs that you want to protect. VMs should be backed up to a vault in the same location. For example - CanadaCentral"
                      + displayName = "Location (Specify the location of the VMs that you want to protect)"
                      + strongType  = "location"
                    }
                  + type     = "String"
                }
            }
        )
      + policy_rule           = jsonencode(
            {
              + if   = {
                  + allOf = [
                      + {
                          + equals = "Microsoft.Compute/virtualMachines"
                          + field  = "type"
                        },
                      + {
                          + field       = "id"
                          + notContains = "/resourceGroups/databricks-rg-"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "azureopenshift"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "AzureDatabricks"
                        },
                      + {
                          + equals = "[parameters('vaultLocation')]"
                          + field  = "location"
                        },
                      + {
                          + field = "[concat('tags[', parameters('inclusionTagName'), ']')]"
                          + in    = "[parameters('inclusionTagValue')]"
                        },
                      + {
                          + anyOf = [
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServer"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "2008-R2-SP1",
                                              + "2008-R2-SP1-smalldisk",
                                              + "2012-Datacenter",
                                              + "2012-Datacenter-smalldisk",
                                              + "2012-R2-Datacenter",
                                              + "2012-R2-Datacenter-smalldisk",
                                              + "2016-Datacenter",
                                              + "2016-datacenter-gensecond",
                                              + "2016-Datacenter-Server-Core",
                                              + "2016-Datacenter-Server-Core-smalldisk",
                                              + "2016-Datacenter-smalldisk",
                                              + "2016-Datacenter-with-Containers",
                                              + "2016-Datacenter-with-RDSH",
                                              + "2019-Datacenter",
                                              + "2019-Datacenter-Core",
                                              + "2019-Datacenter-Core-smalldisk",
                                              + "2019-Datacenter-Core-with-Containers",
                                              + "2019-Datacenter-Core-with-Containers-smalldisk",
                                              + "2019-Datacenter-smalldisk",
                                              + "2019-Datacenter-with-Containers",
                                              + "2019-Datacenter-with-Containers-smalldisk",
                                              + "2019-Datacenter-zhcn",
                                              + "2019-datacenter-gensecond",
                                              + "2022-datacenter-g2",
                                              + "2022-datacenter",
                                              + "2022-datacenter-azure-edition",
                                              + "2022-datacenter-azure-edition-smalldisk",
                                              + "2022-datacenter-azure-edition-core",
                                              + "2022-datacenter-azure-edition-core-smalldisk",
                                              + "2022-datacenter-smalldisk-g2",
                                              + "2022-datacenter-smalldisk",
                                              + "2022-datacenter-core-g2",
                                              + "2022-datacenter-core",
                                              + "2022-datacenter-core-smalldisk-g2",
                                              + "2022-datacenter-core-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerSemiAnnual"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "Datacenter-Core-1709-smalldisk",
                                              + "Datacenter-Core-1709-with-Containers-smalldisk",
                                              + "Datacenter-Core-1803-with-Containers-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftSQLServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2019"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016-BYOL"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2-BYOL"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftRServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "MLServer-WS2016"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftVisualStudio"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "VisualStudio",
                                              + "Windows",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftDynamicsAX"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Dynamics"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + equals = "Pre-Req-AX7-Onebox-U8"
                                          + field  = "Microsoft.Compute/imageSKU"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "microsoft-ads"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "windows-data-science-vm"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-10"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-11"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "RedHat"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "RHEL",
                                              + "RHEL-SAP-HANA",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "8*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "SUSE"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "SLES",
                                              + "SLES-HPC",
                                              + "SLES-HPC-Priority",
                                              + "SLES-SAP",
                                              + "SLES-SAP-BYOS",
                                              + "SLES-Priority",
                                              + "SLES-BYOS",
                                              + "SLES-SAPCAL",
                                              + "SLES-Standard",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "12*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Canonical"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + contains = "ubuntu"
                                          + field    = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "14.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "16.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "18.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "*20_04-lts"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "20_04-lts*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Oracle"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Oracle-Linux"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7.*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "OpenLogic"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "CentOS",
                                              + "Centos-LVM",
                                              + "CentOS-SRIOV",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "cloudera"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "cloudera-centos-os"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + like  = "7*"
                                        },
                                    ]
                                },
                            ]
                        },
                    ]
                }
              + then = {
                  + details = {
                      + deployment        = {
                          + properties = {
                              + mode       = "incremental"
                              + parameters = {
                                  + backupPolicyId       = {
                                      + value = "[parameters('backupPolicyId')]"
                                    }
                                  + fabricName           = {
                                      + value = "Azure"
                                    }
                                  + protectedItems       = {
                                      + value = "[concat('vm;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + protectionContainers = {
                                      + value = "[concat('iaasvmcontainer;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + sourceResourceId     = {
                                      + value = "[concat('/subscriptions/', subscription().subscriptionId, '/resourceGroups/', resourceGroup().name, '/providers/Microsoft.Compute/virtualMachines/',field('name'))]"
                                    }
                                }
                              + template   = {
                                  + "$schema"      = "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                  + contentVersion = "1.0.0.0"
                                  + parameters     = {
                                      + backupPolicyId       = {
                                          + type = "String"
                                        }
                                      + fabricName           = {
                                          + type = "String"
                                        }
                                      + protectedItems       = {
                                          + type = "String"
                                        }
                                      + protectionContainers = {
                                          + type = "String"
                                        }
                                      + sourceResourceId     = {
                                          + type = "String"
                                        }
                                    }
                                  + resources      = [
                                      + {
                                          + apiVersion     = "2017-05-10"
                                          + name           = "[concat('DeployProtection-',uniqueString(parameters('protectedItems')))]"
                                          + properties     = {
                                              + mode       = "Incremental"
                                              + parameters = {
                                                  + backupPolicyId       = {
                                                      + value = "[parameters('backupPolicyId')]"
                                                    }
                                                  + fabricName           = {
                                                      + value = "[parameters('fabricName')]"
                                                    }
                                                  + protectedItems       = {
                                                      + value = "[parameters('protectedItems')]"
                                                    }
                                                  + protectionContainers = {
                                                      + value = "[parameters('protectionContainers')]"
                                                    }
                                                  + sourceResourceId     = {
                                                      + value = "[parameters('sourceResourceId')]"
                                                    }
                                                }
                                              + template   = {
                                                  + "$schema"      = "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                                  + contentVersion = "1.0.0.0"
                                                  + parameters     = {
                                                      + backupPolicyId       = {
                                                          + type = "String"
                                                        }
                                                      + fabricName           = {
                                                          + type = "String"
                                                        }
                                                      + protectedItems       = {
                                                          + type = "String"
                                                        }
                                                      + protectionContainers = {
                                                          + type = "String"
                                                        }
                                                      + sourceResourceId     = {
                                                          + type = "String"
                                                        }
                                                    }
                                                  + resources      = [
                                                      + {
                                                          + apiVersion = "2016-06-01"
                                                          + name       = "[concat(first(skip(split(parameters('backupPolicyId'), '/'), 8)), '/', parameters('fabricName'), '/',parameters('protectionContainers'), '/', parameters('protectedItems'))]"
                                                          + properties = {
                                                              + policyId          = "[parameters('backupPolicyId')]"
                                                              + protectedItemType = "Microsoft.Compute/virtualMachines"
                                                              + sourceResourceId  = "[parameters('sourceResourceId')]"
                                                            }
                                                          + type       = "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems"
                                                        },
                                                    ]
                                                }
                                            }
                                          + resourceGroup  = "[first(skip(split(parameters('backupPolicyId'), '/'), 4))]"
                                          + subscriptionId = "[first(skip(split(parameters('backupPolicyId'), '/'), 2))]"
                                          + type           = "Microsoft.Resources/deployments"
                                        },
                                    ]
                                }
                            }
                        }
                      + roleDefinitionIds = [
                          + "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c",
                          + "/providers/microsoft.authorization/roleDefinitions/5e467623-bb1f-42f4-a55d-6e525e11384b",
                        ]
                      + type              = "Microsoft.RecoveryServices/backupprotecteditems"
                    }
                  + effect  = "[parameters('effect')]"
                }
            }
        )
      + policy_type           = "BuiltIn"
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.policy["Policy1"].azurerm_management_group_policy_assignment.this[0] will be created
  + resource "azurerm_management_group_policy_assignment" "this" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy1-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Platform_T_S"].module.policy["Policy1"].azurerm_policy_definition.this will be created
  + resource "azurerm_policy_definition" "this" {
      + description           = "Enforce backup for all virtual machines by backing them up to an existing central recovery services vault in the same location and subscription as the virtual machine. Doing this is useful when there is a central team in your organization managing backups for all resources in a subscription. You can optionally include virtual machines containing a specified tag to control the scope of assignment. See https://aka.ms/AzureVMCentralBackupIncludeTag."
      + display_name          = "Configure backup on virtual machines with a given tag to an existing recovery services vault in the same location"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = jsonencode(
            {
              + category = "Backup"
              + version  = "9.1.0"
            }
        )
      + mode                  = "Indexed"
      + name                  = "Policy1"
      + parameters            = jsonencode(
            {
              + backupPolicyId    = {
                  + metadata = {
                      + description = "Specify the ID of the Azure Backup policy to configure backup of the virtual machines. The selected Azure Backup policy should be of type Azure Virtual Machine. This policy needs to be in a vault that is present in the location chosen above. For example - /subscriptions/<SubscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.RecoveryServices/vaults/<VaultName>/backupPolicies/<BackupPolicyName>"
                      + displayName = "Backup Policy (of type Azure VM from a vault in the location chosen above)"
                      + strongType  = "Microsoft.RecoveryServices/vaults/backupPolicies"
                    }
                  + type     = "String"
                }
              + effect            = {
                  + allowedValues = [
                      + "auditIfNotExists",
                      + "AuditIfNotExists",
                      + "deployIfNotExists",
                      + "DeployIfNotExists",
                      + "disabled",
                      + "Disabled",
                    ]
                  + defaultValue  = "DeployIfNotExists"
                  + metadata      = {
                      + description = "Enable or disable the execution of the policy"
                      + displayName = "Effect"
                    }
                  + type          = "String"
                }
              + inclusionTagName  = {
                  + defaultValue = ""
                  + metadata     = {
                      + description = "Name of the tag to use for including VMs in the scope of this policy. This should be used along with the Inclusion Tag Value parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy"
                      + displayName = "Inclusion Tag Name"
                    }
                  + type         = "String"
                }
              + inclusionTagValue = {
                  + metadata = {
                      + description = "Value of the tag to use for including VMs in the scope of this policy (in case of multiple values, use a comma-separated list). This should be used along with the Inclusion Tag Name parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy."
                      + displayName = "Inclusion Tag Values"
                    }
                  + type     = "Array"
                }
              + vaultLocation     = {
                  + metadata = {
                      + description = "Specify the location of the VMs that you want to protect. VMs should be backed up to a vault in the same location. For example - CanadaCentral"
                      + displayName = "Location (Specify the location of the VMs that you want to protect)"
                      + strongType  = "location"
                    }
                  + type     = "String"
                }
            }
        )
      + policy_rule           = jsonencode(
            {
              + if   = {
                  + allOf = [
                      + {
                          + equals = "Microsoft.Compute/virtualMachines"
                          + field  = "type"
                        },
                      + {
                          + field       = "id"
                          + notContains = "/resourceGroups/databricks-rg-"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "azureopenshift"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "AzureDatabricks"
                        },
                      + {
                          + equals = "[parameters('vaultLocation')]"
                          + field  = "location"
                        },
                      + {
                          + field = "[concat('tags[', parameters('inclusionTagName'), ']')]"
                          + in    = "[parameters('inclusionTagValue')]"
                        },
                      + {
                          + anyOf = [
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServer"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "2008-R2-SP1",
                                              + "2008-R2-SP1-smalldisk",
                                              + "2012-Datacenter",
                                              + "2012-Datacenter-smalldisk",
                                              + "2012-R2-Datacenter",
                                              + "2012-R2-Datacenter-smalldisk",
                                              + "2016-Datacenter",
                                              + "2016-datacenter-gensecond",
                                              + "2016-Datacenter-Server-Core",
                                              + "2016-Datacenter-Server-Core-smalldisk",
                                              + "2016-Datacenter-smalldisk",
                                              + "2016-Datacenter-with-Containers",
                                              + "2016-Datacenter-with-RDSH",
                                              + "2019-Datacenter",
                                              + "2019-Datacenter-Core",
                                              + "2019-Datacenter-Core-smalldisk",
                                              + "2019-Datacenter-Core-with-Containers",
                                              + "2019-Datacenter-Core-with-Containers-smalldisk",
                                              + "2019-Datacenter-smalldisk",
                                              + "2019-Datacenter-with-Containers",
                                              + "2019-Datacenter-with-Containers-smalldisk",
                                              + "2019-Datacenter-zhcn",
                                              + "2019-datacenter-gensecond",
                                              + "2022-datacenter-g2",
                                              + "2022-datacenter",
                                              + "2022-datacenter-azure-edition",
                                              + "2022-datacenter-azure-edition-smalldisk",
                                              + "2022-datacenter-azure-edition-core",
                                              + "2022-datacenter-azure-edition-core-smalldisk",
                                              + "2022-datacenter-smalldisk-g2",
                                              + "2022-datacenter-smalldisk",
                                              + "2022-datacenter-core-g2",
                                              + "2022-datacenter-core",
                                              + "2022-datacenter-core-smalldisk-g2",
                                              + "2022-datacenter-core-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerSemiAnnual"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "Datacenter-Core-1709-smalldisk",
                                              + "Datacenter-Core-1709-with-Containers-smalldisk",
                                              + "Datacenter-Core-1803-with-Containers-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftSQLServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2019"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016-BYOL"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2-BYOL"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftRServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "MLServer-WS2016"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftVisualStudio"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "VisualStudio",
                                              + "Windows",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftDynamicsAX"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Dynamics"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + equals = "Pre-Req-AX7-Onebox-U8"
                                          + field  = "Microsoft.Compute/imageSKU"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "microsoft-ads"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "windows-data-science-vm"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-10"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-11"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "RedHat"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "RHEL",
                                              + "RHEL-SAP-HANA",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "8*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "SUSE"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "SLES",
                                              + "SLES-HPC",
                                              + "SLES-HPC-Priority",
                                              + "SLES-SAP",
                                              + "SLES-SAP-BYOS",
                                              + "SLES-Priority",
                                              + "SLES-BYOS",
                                              + "SLES-SAPCAL",
                                              + "SLES-Standard",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "12*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Canonical"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + contains = "ubuntu"
                                          + field    = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "14.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "16.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "18.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "*20_04-lts"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "20_04-lts*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Oracle"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Oracle-Linux"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7.*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "OpenLogic"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "CentOS",
                                              + "Centos-LVM",
                                              + "CentOS-SRIOV",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "cloudera"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "cloudera-centos-os"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + like  = "7*"
                                        },
                                    ]
                                },
                            ]
                        },
                    ]
                }
              + then = {
                  + details = {
                      + deployment        = {
                          + properties = {
                              + mode       = "incremental"
                              + parameters = {
                                  + backupPolicyId       = {
                                      + value = "[parameters('backupPolicyId')]"
                                    }
                                  + fabricName           = {
                                      + value = "Azure"
                                    }
                                  + protectedItems       = {
                                      + value = "[concat('vm;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + protectionContainers = {
                                      + value = "[concat('iaasvmcontainer;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + sourceResourceId     = {
                                      + value = "[concat('/subscriptions/', subscription().subscriptionId, '/resourceGroups/', resourceGroup().name, '/providers/Microsoft.Compute/virtualMachines/',field('name'))]"
                                    }
                                }
                              + template   = {
                                  + "$schema"      = "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                  + contentVersion = "1.0.0.0"
                                  + parameters     = {
                                      + backupPolicyId       = {
                                          + type = "String"
                                        }
                                      + fabricName           = {
                                          + type = "String"
                                        }
                                      + protectedItems       = {
                                          + type = "String"
                                        }
                                      + protectionContainers = {
                                          + type = "String"
                                        }
                                      + sourceResourceId     = {
                                          + type = "String"
                                        }
                                    }
                                  + resources      = [
                                      + {
                                          + apiVersion     = "2017-05-10"
                                          + name           = "[concat('DeployProtection-',uniqueString(parameters('protectedItems')))]"
                                          + properties     = {
                                              + mode       = "Incremental"
                                              + parameters = {
                                                  + backupPolicyId       = {
                                                      + value = "[parameters('backupPolicyId')]"
                                                    }
                                                  + fabricName           = {
                                                      + value = "[parameters('fabricName')]"
                                                    }
                                                  + protectedItems       = {
                                                      + value = "[parameters('protectedItems')]"
                                                    }
                                                  + protectionContainers = {
                                                      + value = "[parameters('protectionContainers')]"
                                                    }
                                                  + sourceResourceId     = {
                                                      + value = "[parameters('sourceResourceId')]"
                                                    }
                                                }
                                              + template   = {
                                                  + "$schema"      = "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                                  + contentVersion = "1.0.0.0"
                                                  + parameters     = {
                                                      + backupPolicyId       = {
                                                          + type = "String"
                                                        }
                                                      + fabricName           = {
                                                          + type = "String"
                                                        }
                                                      + protectedItems       = {
                                                          + type = "String"
                                                        }
                                                      + protectionContainers = {
                                                          + type = "String"
                                                        }
                                                      + sourceResourceId     = {
                                                          + type = "String"
                                                        }
                                                    }
                                                  + resources      = [
                                                      + {
                                                          + apiVersion = "2016-06-01"
                                                          + name       = "[concat(first(skip(split(parameters('backupPolicyId'), '/'), 8)), '/', parameters('fabricName'), '/',parameters('protectionContainers'), '/', parameters('protectedItems'))]"
                                                          + properties = {
                                                              + policyId          = "[parameters('backupPolicyId')]"
                                                              + protectedItemType = "Microsoft.Compute/virtualMachines"
                                                              + sourceResourceId  = "[parameters('sourceResourceId')]"
                                                            }
                                                          + type       = "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems"
                                                        },
                                                    ]
                                                }
                                            }
                                          + resourceGroup  = "[first(skip(split(parameters('backupPolicyId'), '/'), 4))]"
                                          + subscriptionId = "[first(skip(split(parameters('backupPolicyId'), '/'), 2))]"
                                          + type           = "Microsoft.Resources/deployments"
                                        },
                                    ]
                                }
                            }
                        }
                      + roleDefinitionIds = [
                          + "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c",
                          + "/providers/microsoft.authorization/roleDefinitions/5e467623-bb1f-42f4-a55d-6e525e11384b",
                        ]
                      + type              = "Microsoft.RecoveryServices/backupprotecteditems"
                    }
                  + effect  = "[parameters('effect')]"
                }
            }
        )
      + policy_type           = "BuiltIn"
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

  # module.mangmet_groups_first_level["Policy_staging"].module.policy["Policy24"].azurerm_management_group_policy_assignment.this[0] will be created
  + resource "azurerm_management_group_policy_assignment" "this" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy24-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Policy_staging"].module.policy["Policy24"].azurerm_policy_definition.this will be created
  + resource "azurerm_policy_definition" "this" {
      + description           = "Enforce backup for all virtual machines by backing them up to an existing central recovery services vault in the same location and subscription as the virtual machine. Doing this is useful when there is a central team in your organization managing backups for all resources in a subscription. You can optionally include virtual machines containing a specified tag to control the scope of assignment. See https://aka.ms/AzureVMCentralBackupIncludeTag."
      + display_name          = "Configure backup on virtual machines with a given tag to an existing recovery services vault in the same location"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = jsonencode(
            {
              + category = "Backup"
              + version  = "9.1.0"
            }
        )
      + mode                  = "Indexed"
      + name                  = "Policy24"
      + parameters            = jsonencode(
            {
              + backupPolicyId    = {
                  + metadata = {
                      + description = "Specify the ID of the Azure Backup policy to configure backup of the virtual machines. The selected Azure Backup policy should be of type Azure Virtual Machine. This policy needs to be in a vault that is present in the location chosen above. For example - /subscriptions/<SubscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.RecoveryServices/vaults/<VaultName>/backupPolicies/<BackupPolicyName>"
                      + displayName = "Backup Policy (of type Azure VM from a vault in the location chosen above)"
                      + strongType  = "Microsoft.RecoveryServices/vaults/backupPolicies"
                    }
                  + type     = "String"
                }
              + effect            = {
                  + allowedValues = [
                      + "auditIfNotExists",
                      + "AuditIfNotExists",
                      + "deployIfNotExists",
                      + "DeployIfNotExists",
                      + "disabled",
                      + "Disabled",
                    ]
                  + defaultValue  = "DeployIfNotExists"
                  + metadata      = {
                      + description = "Enable or disable the execution of the policy"
                      + displayName = "Effect"
                    }
                  + type          = "String"
                }
              + inclusionTagName  = {
                  + defaultValue = ""
                  + metadata     = {
                      + description = "Name of the tag to use for including VMs in the scope of this policy. This should be used along with the Inclusion Tag Value parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy"
                      + displayName = "Inclusion Tag Name"
                    }
                  + type         = "String"
                }
              + inclusionTagValue = {
                  + metadata = {
                      + description = "Value of the tag to use for including VMs in the scope of this policy (in case of multiple values, use a comma-separated list). This should be used along with the Inclusion Tag Name parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy."
                      + displayName = "Inclusion Tag Values"
                    }
                  + type     = "Array"
                }
              + vaultLocation     = {
                  + metadata = {
                      + description = "Specify the location of the VMs that you want to protect. VMs should be backed up to a vault in the same location. For example - CanadaCentral"
                      + displayName = "Location (Specify the location of the VMs that you want to protect)"
                      + strongType  = "location"
                    }
                  + type     = "String"
                }
            }
        )
      + policy_rule           = jsonencode(
            {
              + if   = {
                  + allOf = [
                      + {
                          + equals = "Microsoft.Compute/virtualMachines"
                          + field  = "type"
                        },
                      + {
                          + field       = "id"
                          + notContains = "/resourceGroups/databricks-rg-"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "azureopenshift"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "AzureDatabricks"
                        },
                      + {
                          + equals = "[parameters('vaultLocation')]"
                          + field  = "location"
                        },
                      + {
                          + field = "[concat('tags[', parameters('inclusionTagName'), ']')]"
                          + in    = "[parameters('inclusionTagValue')]"
                        },
                      + {
                          + anyOf = [
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServer"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "2008-R2-SP1",
                                              + "2008-R2-SP1-smalldisk",
                                              + "2012-Datacenter",
                                              + "2012-Datacenter-smalldisk",
                                              + "2012-R2-Datacenter",
                                              + "2012-R2-Datacenter-smalldisk",
                                              + "2016-Datacenter",
                                              + "2016-datacenter-gensecond",
                                              + "2016-Datacenter-Server-Core",
                                              + "2016-Datacenter-Server-Core-smalldisk",
                                              + "2016-Datacenter-smalldisk",
                                              + "2016-Datacenter-with-Containers",
                                              + "2016-Datacenter-with-RDSH",
                                              + "2019-Datacenter",
                                              + "2019-Datacenter-Core",
                                              + "2019-Datacenter-Core-smalldisk",
                                              + "2019-Datacenter-Core-with-Containers",
                                              + "2019-Datacenter-Core-with-Containers-smalldisk",
                                              + "2019-Datacenter-smalldisk",
                                              + "2019-Datacenter-with-Containers",
                                              + "2019-Datacenter-with-Containers-smalldisk",
                                              + "2019-Datacenter-zhcn",
                                              + "2019-datacenter-gensecond",
                                              + "2022-datacenter-g2",
                                              + "2022-datacenter",
                                              + "2022-datacenter-azure-edition",
                                              + "2022-datacenter-azure-edition-smalldisk",
                                              + "2022-datacenter-azure-edition-core",
                                              + "2022-datacenter-azure-edition-core-smalldisk",
                                              + "2022-datacenter-smalldisk-g2",
                                              + "2022-datacenter-smalldisk",
                                              + "2022-datacenter-core-g2",
                                              + "2022-datacenter-core",
                                              + "2022-datacenter-core-smalldisk-g2",
                                              + "2022-datacenter-core-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerSemiAnnual"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "Datacenter-Core-1709-smalldisk",
                                              + "Datacenter-Core-1709-with-Containers-smalldisk",
                                              + "Datacenter-Core-1803-with-Containers-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftSQLServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2019"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016-BYOL"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2-BYOL"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftRServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "MLServer-WS2016"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftVisualStudio"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "VisualStudio",
                                              + "Windows",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftDynamicsAX"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Dynamics"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + equals = "Pre-Req-AX7-Onebox-U8"
                                          + field  = "Microsoft.Compute/imageSKU"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "microsoft-ads"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "windows-data-science-vm"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-10"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-11"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "RedHat"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "RHEL",
                                              + "RHEL-SAP-HANA",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "8*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "SUSE"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "SLES",
                                              + "SLES-HPC",
                                              + "SLES-HPC-Priority",
                                              + "SLES-SAP",
                                              + "SLES-SAP-BYOS",
                                              + "SLES-Priority",
                                              + "SLES-BYOS",
                                              + "SLES-SAPCAL",
                                              + "SLES-Standard",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "12*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Canonical"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + contains = "ubuntu"
                                          + field    = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "14.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "16.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "18.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "*20_04-lts"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "20_04-lts*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Oracle"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Oracle-Linux"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7.*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "OpenLogic"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "CentOS",
                                              + "Centos-LVM",
                                              + "CentOS-SRIOV",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "cloudera"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "cloudera-centos-os"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + like  = "7*"
                                        },
                                    ]
                                },
                            ]
                        },
                    ]
                }
              + then = {
                  + details = {
                      + deployment        = {
                          + properties = {
                              + mode       = "incremental"
                              + parameters = {
                                  + backupPolicyId       = {
                                      + value = "[parameters('backupPolicyId')]"
                                    }
                                  + fabricName           = {
                                      + value = "Azure"
                                    }
                                  + protectedItems       = {
                                      + value = "[concat('vm;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + protectionContainers = {
                                      + value = "[concat('iaasvmcontainer;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + sourceResourceId     = {
                                      + value = "[concat('/subscriptions/', subscription().subscriptionId, '/resourceGroups/', resourceGroup().name, '/providers/Microsoft.Compute/virtualMachines/',field('name'))]"
                                    }
                                }
                              + template   = {
                                  + "$schema"      = "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                  + contentVersion = "1.0.0.0"
                                  + parameters     = {
                                      + backupPolicyId       = {
                                          + type = "String"
                                        }
                                      + fabricName           = {
                                          + type = "String"
                                        }
                                      + protectedItems       = {
                                          + type = "String"
                                        }
                                      + protectionContainers = {
                                          + type = "String"
                                        }
                                      + sourceResourceId     = {
                                          + type = "String"
                                        }
                                    }
                                  + resources      = [
                                      + {
                                          + apiVersion     = "2017-05-10"
                                          + name           = "[concat('DeployProtection-',uniqueString(parameters('protectedItems')))]"
                                          + properties     = {
                                              + mode       = "Incremental"
                                              + parameters = {
                                                  + backupPolicyId       = {
                                                      + value = "[parameters('backupPolicyId')]"
                                                    }
                                                  + fabricName           = {
                                                      + value = "[parameters('fabricName')]"
                                                    }
                                                  + protectedItems       = {
                                                      + value = "[parameters('protectedItems')]"
                                                    }
                                                  + protectionContainers = {
                                                      + value = "[parameters('protectionContainers')]"
                                                    }
                                                  + sourceResourceId     = {
                                                      + value = "[parameters('sourceResourceId')]"
                                                    }
                                                }
                                              + template   = {
                                                  + "$schema"      = "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                                  + contentVersion = "1.0.0.0"
                                                  + parameters     = {
                                                      + backupPolicyId       = {
                                                          + type = "String"
                                                        }
                                                      + fabricName           = {
                                                          + type = "String"
                                                        }
                                                      + protectedItems       = {
                                                          + type = "String"
                                                        }
                                                      + protectionContainers = {
                                                          + type = "String"
                                                        }
                                                      + sourceResourceId     = {
                                                          + type = "String"
                                                        }
                                                    }
                                                  + resources      = [
                                                      + {
                                                          + apiVersion = "2016-06-01"
                                                          + name       = "[concat(first(skip(split(parameters('backupPolicyId'), '/'), 8)), '/', parameters('fabricName'), '/',parameters('protectionContainers'), '/', parameters('protectedItems'))]"
                                                          + properties = {
                                                              + policyId          = "[parameters('backupPolicyId')]"
                                                              + protectedItemType = "Microsoft.Compute/virtualMachines"
                                                              + sourceResourceId  = "[parameters('sourceResourceId')]"
                                                            }
                                                          + type       = "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems"
                                                        },
                                                    ]
                                                }
                                            }
                                          + resourceGroup  = "[first(skip(split(parameters('backupPolicyId'), '/'), 4))]"
                                          + subscriptionId = "[first(skip(split(parameters('backupPolicyId'), '/'), 2))]"
                                          + type           = "Microsoft.Resources/deployments"
                                        },
                                    ]
                                }
                            }
                        }
                      + roleDefinitionIds = [
                          + "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c",
                          + "/providers/microsoft.authorization/roleDefinitions/5e467623-bb1f-42f4-a55d-6e525e11384b",
                        ]
                      + type              = "Microsoft.RecoveryServices/backupprotecteditems"
                    }
                  + effect  = "[parameters('effect')]"
                }
            }
        )
      + policy_type           = "BuiltIn"
    }

  # module.mangmet_groups_first_level["Workload"].module.policy["Policy23"].azurerm_management_group_policy_assignment.this[0] will be created
  + resource "azurerm_management_group_policy_assignment" "this" {
      + enforce              = true
      + id                   = (known after apply)
      + management_group_id  = (known after apply)
      + metadata             = (known after apply)
      + name                 = "Policy23-assignment"
      + policy_definition_id = (known after apply)
    }

  # module.mangmet_groups_first_level["Workload"].module.policy["Policy23"].azurerm_policy_definition.this will be created
  + resource "azurerm_policy_definition" "this" {
      + description           = "Enforce backup for all virtual machines by backing them up to an existing central recovery services vault in the same location and subscription as the virtual machine. Doing this is useful when there is a central team in your organization managing backups for all resources in a subscription. You can optionally include virtual machines containing a specified tag to control the scope of assignment. See https://aka.ms/AzureVMCentralBackupIncludeTag."
      + display_name          = "Configure backup on virtual machines with a given tag to an existing recovery services vault in the same location"
      + id                    = (known after apply)
      + management_group_id   = (known after apply)
      + management_group_name = (known after apply)
      + metadata              = jsonencode(
            {
              + category = "Backup"
              + version  = "9.1.0"
            }
        )
      + mode                  = "Indexed"
      + name                  = "Policy23"
      + parameters            = jsonencode(
            {
              + backupPolicyId    = {
                  + metadata = {
                      + description = "Specify the ID of the Azure Backup policy to configure backup of the virtual machines. The selected Azure Backup policy should be of type Azure Virtual Machine. This policy needs to be in a vault that is present in the location chosen above. For example - /subscriptions/<SubscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.RecoveryServices/vaults/<VaultName>/backupPolicies/<BackupPolicyName>"
                      + displayName = "Backup Policy (of type Azure VM from a vault in the location chosen above)"
                      + strongType  = "Microsoft.RecoveryServices/vaults/backupPolicies"
                    }
                  + type     = "String"
                }
              + effect            = {
                  + allowedValues = [
                      + "auditIfNotExists",
                      + "AuditIfNotExists",
                      + "deployIfNotExists",
                      + "DeployIfNotExists",
                      + "disabled",
                      + "Disabled",
                    ]
                  + defaultValue  = "DeployIfNotExists"
                  + metadata      = {
                      + description = "Enable or disable the execution of the policy"
                      + displayName = "Effect"
                    }
                  + type          = "String"
                }
              + inclusionTagName  = {
                  + defaultValue = ""
                  + metadata     = {
                      + description = "Name of the tag to use for including VMs in the scope of this policy. This should be used along with the Inclusion Tag Value parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy"
                      + displayName = "Inclusion Tag Name"
                    }
                  + type         = "String"
                }
              + inclusionTagValue = {
                  + metadata = {
                      + description = "Value of the tag to use for including VMs in the scope of this policy (in case of multiple values, use a comma-separated list). This should be used along with the Inclusion Tag Name parameter. Learn more at https://aka.ms/AppCentricVMBackupPolicy."
                      + displayName = "Inclusion Tag Values"
                    }
                  + type     = "Array"
                }
              + vaultLocation     = {
                  + metadata = {
                      + description = "Specify the location of the VMs that you want to protect. VMs should be backed up to a vault in the same location. For example - CanadaCentral"
                      + displayName = "Location (Specify the location of the VMs that you want to protect)"
                      + strongType  = "location"
                    }
                  + type     = "String"
                }
            }
        )
      + policy_rule           = jsonencode(
            {
              + if   = {
                  + allOf = [
                      + {
                          + equals = "Microsoft.Compute/virtualMachines"
                          + field  = "type"
                        },
                      + {
                          + field       = "id"
                          + notContains = "/resourceGroups/databricks-rg-"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "azureopenshift"
                        },
                      + {
                          + field     = "Microsoft.Compute/imagePublisher"
                          + notEquals = "AzureDatabricks"
                        },
                      + {
                          + equals = "[parameters('vaultLocation')]"
                          + field  = "location"
                        },
                      + {
                          + field = "[concat('tags[', parameters('inclusionTagName'), ']')]"
                          + in    = "[parameters('inclusionTagValue')]"
                        },
                      + {
                          + anyOf = [
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServer"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "2008-R2-SP1",
                                              + "2008-R2-SP1-smalldisk",
                                              + "2012-Datacenter",
                                              + "2012-Datacenter-smalldisk",
                                              + "2012-R2-Datacenter",
                                              + "2012-R2-Datacenter-smalldisk",
                                              + "2016-Datacenter",
                                              + "2016-datacenter-gensecond",
                                              + "2016-Datacenter-Server-Core",
                                              + "2016-Datacenter-Server-Core-smalldisk",
                                              + "2016-Datacenter-smalldisk",
                                              + "2016-Datacenter-with-Containers",
                                              + "2016-Datacenter-with-RDSH",
                                              + "2019-Datacenter",
                                              + "2019-Datacenter-Core",
                                              + "2019-Datacenter-Core-smalldisk",
                                              + "2019-Datacenter-Core-with-Containers",
                                              + "2019-Datacenter-Core-with-Containers-smalldisk",
                                              + "2019-Datacenter-smalldisk",
                                              + "2019-Datacenter-with-Containers",
                                              + "2019-Datacenter-with-Containers-smalldisk",
                                              + "2019-Datacenter-zhcn",
                                              + "2019-datacenter-gensecond",
                                              + "2022-datacenter-g2",
                                              + "2022-datacenter",
                                              + "2022-datacenter-azure-edition",
                                              + "2022-datacenter-azure-edition-smalldisk",
                                              + "2022-datacenter-azure-edition-core",
                                              + "2022-datacenter-azure-edition-core-smalldisk",
                                              + "2022-datacenter-smalldisk-g2",
                                              + "2022-datacenter-smalldisk",
                                              + "2022-datacenter-core-g2",
                                              + "2022-datacenter-core",
                                              + "2022-datacenter-core-smalldisk-g2",
                                              + "2022-datacenter-core-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerSemiAnnual"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + in    = [
                                              + "Datacenter-Core-1709-smalldisk",
                                              + "Datacenter-Core-1709-with-Containers-smalldisk",
                                              + "Datacenter-Core-1803-with-Containers-smalldisk",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "WindowsServerHPCPack"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftSQLServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2019"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2016-BYOL"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageOffer"
                                                  + like  = "*-WS2012R2-BYOL"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftRServer"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "MLServer-WS2016"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftVisualStudio"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "VisualStudio",
                                              + "Windows",
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftDynamicsAX"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Dynamics"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + equals = "Pre-Req-AX7-Onebox-U8"
                                          + field  = "Microsoft.Compute/imageSKU"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "microsoft-ads"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "windows-data-science-vm"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-10"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "MicrosoftWindowsDesktop"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Windows-11"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "RedHat"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "RHEL",
                                              + "RHEL-SAP-HANA",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "8*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "SUSE"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "SLES",
                                              + "SLES-HPC",
                                              + "SLES-HPC-Priority",
                                              + "SLES-SAP",
                                              + "SLES-SAP-BYOS",
                                              + "SLES-Priority",
                                              + "SLES-BYOS",
                                              + "SLES-SAPCAL",
                                              + "SLES-Standard",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "12*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Canonical"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + contains = "ubuntu"
                                          + field    = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "14.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "16.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "18.04*LTS"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "*20_04-lts"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "20_04-lts*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "Oracle"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "Oracle-Linux"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7.*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "OpenLogic"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageOffer"
                                          + in    = [
                                              + "CentOS",
                                              + "Centos-LVM",
                                              + "CentOS-SRIOV",
                                            ]
                                        },
                                      + {
                                          + anyOf = [
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "6.*"
                                                },
                                              + {
                                                  + field = "Microsoft.Compute/imageSKU"
                                                  + like  = "7*"
                                                },
                                            ]
                                        },
                                    ]
                                },
                              + {
                                  + allOf = [
                                      + {
                                          + equals = "cloudera"
                                          + field  = "Microsoft.Compute/imagePublisher"
                                        },
                                      + {
                                          + equals = "cloudera-centos-os"
                                          + field  = "Microsoft.Compute/imageOffer"
                                        },
                                      + {
                                          + field = "Microsoft.Compute/imageSKU"
                                          + like  = "7*"
                                        },
                                    ]
                                },
                            ]
                        },
                    ]
                }
              + then = {
                  + details = {
                      + deployment        = {
                          + properties = {
                              + mode       = "incremental"
                              + parameters = {
                                  + backupPolicyId       = {
                                      + value = "[parameters('backupPolicyId')]"
                                    }
                                  + fabricName           = {
                                      + value = "Azure"
                                    }
                                  + protectedItems       = {
                                      + value = "[concat('vm;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + protectionContainers = {
                                      + value = "[concat('iaasvmcontainer;iaasvmcontainerv2;', resourceGroup().name, ';' ,field('name'))]"
                                    }
                                  + sourceResourceId     = {
                                      + value = "[concat('/subscriptions/', subscription().subscriptionId, '/resourceGroups/', resourceGroup().name, '/providers/Microsoft.Compute/virtualMachines/',field('name'))]"
                                    }
                                }
                              + template   = {
                                  + "$schema"      = "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                  + contentVersion = "1.0.0.0"
                                  + parameters     = {
                                      + backupPolicyId       = {
                                          + type = "String"
                                        }
                                      + fabricName           = {
                                          + type = "String"
                                        }
                                      + protectedItems       = {
                                          + type = "String"
                                        }
                                      + protectionContainers = {
                                          + type = "String"
                                        }
                                      + sourceResourceId     = {
                                          + type = "String"
                                        }
                                    }
                                  + resources      = [
                                      + {
                                          + apiVersion     = "2017-05-10"
                                          + name           = "[concat('DeployProtection-',uniqueString(parameters('protectedItems')))]"
                                          + properties     = {
                                              + mode       = "Incremental"
                                              + parameters = {
                                                  + backupPolicyId       = {
                                                      + value = "[parameters('backupPolicyId')]"
                                                    }
                                                  + fabricName           = {
                                                      + value = "[parameters('fabricName')]"
                                                    }
                                                  + protectedItems       = {
                                                      + value = "[parameters('protectedItems')]"
                                                    }
                                                  + protectionContainers = {
                                                      + value = "[parameters('protectionContainers')]"
                                                    }
                                                  + sourceResourceId     = {
                                                      + value = "[parameters('sourceResourceId')]"
                                                    }
                                                }
                                              + template   = {
                                                  + "$schema"      = "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
                                                  + contentVersion = "1.0.0.0"
                                                  + parameters     = {
                                                      + backupPolicyId       = {
                                                          + type = "String"
                                                        }
                                                      + fabricName           = {
                                                          + type = "String"
                                                        }
                                                      + protectedItems       = {
                                                          + type = "String"
                                                        }
                                                      + protectionContainers = {
                                                          + type = "String"
                                                        }
                                                      + sourceResourceId     = {
                                                          + type = "String"
                                                        }
                                                    }
                                                  + resources      = [
                                                      + {
                                                          + apiVersion = "2016-06-01"
                                                          + name       = "[concat(first(skip(split(parameters('backupPolicyId'), '/'), 8)), '/', parameters('fabricName'), '/',parameters('protectionContainers'), '/', parameters('protectedItems'))]"
                                                          + properties = {
                                                              + policyId          = "[parameters('backupPolicyId')]"
                                                              + protectedItemType = "Microsoft.Compute/virtualMachines"
                                                              + sourceResourceId  = "[parameters('sourceResourceId')]"
                                                            }
                                                          + type       = "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems"
                                                        },
                                                    ]
                                                }
                                            }
                                          + resourceGroup  = "[first(skip(split(parameters('backupPolicyId'), '/'), 4))]"
                                          + subscriptionId = "[first(skip(split(parameters('backupPolicyId'), '/'), 2))]"
                                          + type           = "Microsoft.Resources/deployments"
                                        },
                                    ]
                                }
                            }
                        }
                      + roleDefinitionIds = [
                          + "/providers/microsoft.authorization/roleDefinitions/9980e02c-c2be-4d73-94e8-173b1dc7cf3c",
                          + "/providers/microsoft.authorization/roleDefinitions/5e467623-bb1f-42f4-a55d-6e525e11384b",
                        ]
                      + type              = "Microsoft.RecoveryServices/backupprotecteditems"
                    }
                  + effect  = "[parameters('effect')]"
                }
            }
        )
      + policy_type           = "BuiltIn"
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

Plan: 30 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + local = {
      + category = "Backup"
      + version  = "9.1.0"
    }
╷
│ Error: Management Group "Workload" was not found
│
│   with module.mangmet_groups_second_level["Non_Prod"].data.azurerm_management_group.mangment_group_id,
│   on modules/managment_group_parent/data.tf line 1, in data "azurerm_management_group" "mangment_group_id":
│    1: data "azurerm_management_group" "mangment_group_id" {
│
╵
╷
│ Error: Management Group "Workload" was not found
│
│   with module.mangmet_groups_second_level["Prod"].data.azurerm_management_group.mangment_group_id,
│   on modules/managment_group_parent/data.tf line 1, in data "azurerm_management_group" "mangment_group_id":
│    1: data "azurerm_management_group" "mangment_group_id" {
│
╵
╷
│ Error: Management Group "Workload" was not found
│
│   with module.mangmet_groups_second_level["SandBox"].data.azurerm_management_group.mangment_group_id,
│   on modules/managment_group_parent/data.tf line 1, in data "azurerm_management_group" "mangment_group_id":
│    1: data "azurerm_management_group" "mangment_group_id" {
│
╵
```