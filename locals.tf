locals {
  mangemnt_groups_first_level = {
    "Platform_T_S" = {
      subscriptions = ["Platform_Prod","Platform_NonProd","Platform_Sandbox"]
      managment_policy = {
        "Policy1" = {
          policy_name = "Policy1"
          policy_file = "${path.cwd}/policy/tag_vault_add.json"
        }
      }
    }
    "Workload" = {
      subscriptions = []
      managment_policy = {
        "Policy23" = {
          policy_name = "Policy23"
          policy_file = "${path.cwd}/policy/tag_vault_add.json"
        }
      }
    }
    "Exporatory" = {
      subscriptions = []
      managment_policy = {
        "Policy26" = {
          policy_name = "Policy26"
          policy_file = "${path.cwd}/policy/tag_vault_add.json"
        }
      }
    }
    "Policy_staging" = {
      subscriptions = []
      managment_policy = {
        "Policy24" = {
          policy_name = "Policy24"
          policy_file = "${path.cwd}/policy/tag_vault_add.json"
        }
      }
    }
    "Suspended" = {
      subscriptions = []
      managment_policy = {}
    }
  }
  management_groups_second_level = {
    "Prod" = {
      parent_name = "Workload"
      subscriptions = []
    }
    "Non_Prod" = {
      parent_name = "Workload"
      subscriptions = ["R_&_D","Supply_Chain","Commercial","Corporate"]
    }
    "SandBox" = {
      parent_name = "Workload"
      subscriptions = []
    }
  }
  
  user_data = jsondecode(file("${path.cwd}/policy/tag_vault_add.json"))
}

