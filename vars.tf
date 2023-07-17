
variable "root_mangment_group" {
  type = string
}
variable "mangemnt_groups_list" {
  type = list(map(string))
}
variable "subscriptions_list" {
  type = list(map(string))
}

variable "mangment_policy_list" {
  type = list(map(string))
}

variable "subscription_policy_llist" {
  type = list(map(string))
}