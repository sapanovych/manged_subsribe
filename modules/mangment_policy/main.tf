resource "azurerm_policy_definition" "example" {
  name                = var.policy_name
  policy_type         = "Custom"
  mode                = "All"
  display_name        = var.policy_name
  management_group_id = var.managment_group_id

  policy_rule = var.policy_value
}
resource "azurerm_management_group_policy_assignment" "example" {
  name                 = "${var.policy_name}-assignment"
  policy_definition_id = azurerm_policy_definition.example.id
  management_group_id  = var.managment_group_id
}