output "mengment_groups_ids" {
  value = {
    for k, bd in azurerm_management_group. : k => bd.name
}