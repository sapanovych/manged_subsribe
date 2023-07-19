variable "mangment_group"{
  type = string
  description = "Name for management group, also display name too"
}
variable "subscription_list" {
  type = list(string)
  description = "List subscrtions - only names. UUID generated automatically."
}

variable "parrent_name" {
  type = string
  default = "nonid"
  description = "Name of the parent management group"
}