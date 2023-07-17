resource "azurerm_management_group" "mgmt_group" {
  for_each =  var.mangment_group 
  display_name               = each.key
  parent_management_group_id = var.parent_management_group_id

  name = var.management_group_internal_name
}
