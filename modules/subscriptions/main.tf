resource "azurerm_subscription" "this" {

for_each = to_set() 
  
  subscription_name = local.name_from_descriptor
  alias             = local.name_from_descriptor

  billing_scope_id = one(data.azurerm_billing_enrollment_account_scope.this.*.id)

  tags = module.this.tags
}

resource "azurerm_management_group_subscription_association" "this" {

  management_group_id = var.management_group_id
  subscription_id     = local.subscription_resource_id
}