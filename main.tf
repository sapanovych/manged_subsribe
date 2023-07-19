module "mangmet_groups_first_level" {
    for_each = local.mangemnt_groups_first_level
    source = "./modules/mangment_groups"
    mangment_group = each.key
    subscription_list = each.value.subscriptions
} 
module "mangmet_groups_second_level" {
    for_each = local.management_groups_second_level
    source = "./modules/mangment_groups_parrent"
    mangment_group = each.key
    subscription_list = each.value.subscriptions
    parrent_name = each.value.parrent_name
}
#module "subscripttions" {
#    source = "./modules/subscriptions"
#    mangment_group_ids = module.mangmet_groups.mengment_groups_ids
#    subscriptions_list = var.subscriptions_list
#}