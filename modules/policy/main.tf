resource "azurerm_policy_definition" "this" {
  name                = var.policy_name
  policy_type         = local.user_data.properties.policyType
  mode                = local.user_data.properties.mode
  display_name        = local.user_data.properties.displayName
  description         = local.user_data.properties.description

  metadata            = jsonencode(local.user_data.properties.metadata)
  policy_rule         = jsonencode(local.user_data.properties.policyRule)
  parameters          = jsonencode(local.user_data.properties.parameters)
}

resource "azurerm_management_group_policy_assignment" "this" {
  count = var.is_mngmt ? 1 : 0
  name                 = "${var.policy_name}-assignment"
  policy_definition_id = azurerm_policy_definition.this.id
  management_group_id  = var.managment_group_id
}

resource "azurerm_subscription_policy_assignment" "this" {
  count =  var.is_subs ? 1 : 0
  name                 = "${var.policy_name}-assignment"
  policy_definition_id = azurerm_policy_definition.this.id
  subscription_id = var.subscription_id
}