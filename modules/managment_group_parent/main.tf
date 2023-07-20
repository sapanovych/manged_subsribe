resource "azurerm_management_group" "mgmt_group" {
  display_name = var.mangment_group 
  name = var.mangment_group 
  parent_management_group_id = data.azurerm_management_group.mangment_group_id
}

module "subscrption" {
  source = "../../modules/subscriptions"
  for_each = toset(var.subscription_list)
  subscription_name = each.key
  mangment_group_id = azurerm_management_group.mgmt_group.id
}

module "policy" {
  source = "../../modules/policy"
  for_each = var.managment_policy
  policy_file = each.value.policy_file
  policy_name = each.value.policy_name
  is_mngmt = true
  managment_group_id = azurerm_management_group.mgmt_group.id
}