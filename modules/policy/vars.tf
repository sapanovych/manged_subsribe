variable "policy_name" {
  type = string
}

variable "managment_group_id" {
  type = string
  default = false
}

variable "subscription_id" {
  type = string
  default = false
}

variable "is_mngmt" {
  type = bool
  default = false
}

variable "is_subs" {
  type = bool
  default = false
}

variable "policy_file" {
  type = string
  default = ""
}