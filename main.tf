module "mangmet_groups" {
    source = "./modules/mangment_group"
    mangment_groups = mangemnt_groups_list
} 

module "subscripttions" {
    source = "./modules/subscriptions"
    mangment_group_ids = module.mangmet_groups.mengment_groups_ids
    subscriptions_list = var.subscriptions_list
}