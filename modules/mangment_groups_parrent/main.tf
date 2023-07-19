#resource "azurerm_subscription" "example" {
#  for_each = toset(var.subscription_list)
#  subscription_name = each.key
#  subscription_id = each.key
#}

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