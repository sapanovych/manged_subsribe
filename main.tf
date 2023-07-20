module "mangmet_groups_first_level" {
  for_each = local.mangemnt_groups_first_level
  source = "./modules/managment_group"
  mangment_group = each.key
  subscription_list = each.value.subscriptions
  managment_policy = each.value.managment_policy
} 

module "mangmet_groups_second_level" {
  for_each = local.management_groups_second_level
  source = "./modules/managment_group_parent"
  mangment_group = each.key
  subscription_list = each.value.subscriptions
  parent_name = each.value.parent_name
}
