locals {
    mangemnt_groups_first_level = {
        "Platform_T_S" = {
            subscriptions = ["Platform_Prod","Platform_NonProd","Platform_Sandbox"]
            managment_policy = {
                "Policy1" = {
                    policy_name = "Policy1"
                    policy_value = jsonencode({"something":"something"})
                }
            }
        }
        "Workload" = {
            subscriptions = []
            managment_policy = {
                "Policy23" = {
                    policy_name = "Policy23"
                    policy_value = jsonencode({"something":"something"})
                }
            }
        }
        "Exporatory" = {
            subscriptions = []
            managment_policy = {
                "Policy26" = {
                    policy_name = "Policy26"
                    policy_value = jsonencode({"something":"something"})
                }
            }
        }
        "Policy_staging" = {
            subscriptions = []
            managment_policy = {
                "Policy24" = {
                    policy_name = "Policy24"
                    policy_value = jsonencode({"something":"something"})
                }
            }
        }
        "Suspended" = {
            subscriptions = []
            managment_policy = {
                "Policy25" = {
                    policy_name = "Policy25"
                    policy_value = jsonencode({"something":"something"})
                }
            }
        }
    }
    management_groups_second_level = {
        "Prod" = {
            parrent_name = "Workload"
            subscriptions = []
        }
        "Non_Prod" = {
            parrent_name = "Workload"
            subscriptions = ["R_&_D","Supply_Chain","Commercial","Corporate"]
        }
        "SandBox" = {
            parrent_name = "Workload"
            subscriptions = []
        }
    }
}