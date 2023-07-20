locals {
    # get json 
    user_data = jsondecode(file("${var.policy_file}"))
}