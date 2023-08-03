variable "vpc_main_name" {
  type        = string
  default     = "master-1"
  description = "vpc name"
}
variable "vpc_main_cidr_block" {
  type    = string
  default = "192.169.0.0/16"
}
variable "vswitch_master-1_name" {
  type = string
}
variable "vswitch_master-1_cidr_block" {
  type = string
}
variable "vswitch_master-1_zone" {
  type = string
}

