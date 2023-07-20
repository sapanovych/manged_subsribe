variable "mangment_group"{
  type = string
  description = "Name for management group, also display name too"
}

variable "subscription_list" {
  type = list(string)
  description = "List subscrtions - only names. UUID generated automatically."
  default = []
}

variable "managment_policy" {
  type = map(map(string))
  default = {}
}