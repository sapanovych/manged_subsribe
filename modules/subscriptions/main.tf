resource "random_uuid" "this" {
}

resource "azurerm_subscription" "this" {
  subscription_name = var.subscription_name
  subscription_id = random_uuid.this.result
}

resource "azurerm_management_group_subscription_association" "this" {
  management_group_id = var.mangment_group_id
  subscription_id     = azurerm_subscription.this.id
}