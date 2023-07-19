locals {
    mangemnt_groups_first_level = {
        "Platform_T_S" = {
            subscriptions = ["Platform_Prod","Platform_NonProd","Platform_Sandbox"]
        }
        "Workload" = {
            subscriptions = []
        }
        "Exporatory" = {
            subscriptions = []
        }
        "Policy_staging" = {
            subscriptions = []
        }
        "Suspended" = {
            subscriptions = []
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