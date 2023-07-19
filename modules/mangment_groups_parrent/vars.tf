variable "mangment_group"{
  type = string
}
variable "subscription_list" {
  type = list(string)
}

variable "parrent_name" {
  type = string
  default = "nonid"
}