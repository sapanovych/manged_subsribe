#resource "azurerm_subscription" "example" {
#  for_each = toset(var.subscription_list)
#  subscription_name = each.key
#  subscription_id = each.key
#}
resource "azurerm_management_group" "mgmt_group" {
  display_name = var.mangment_group 
  name = var.mangment_group 
}

module "subscrption" {
  source = "../../modules/subscriptions"
  for_each = toset(var.subscription_list)
  subscription_name = each.key
  mangment_group_id = azurerm_management_group.mgmt_group.id
}