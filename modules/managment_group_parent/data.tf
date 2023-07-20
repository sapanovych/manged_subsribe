data "azurerm_management_group" "mangment_group_id" {
  name = var.parent_name
}