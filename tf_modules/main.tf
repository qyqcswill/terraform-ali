resource "alicloud_vpc" "main" {
  vpc_name   = var.vpc_main_name
  cidr_block = var.vpc_main_cidr_block
}
resource "alicloud_vswitch" "master-1" {
  vswitch_name = var.vswitch_master-1_name
  cidr_block   = var.vswitch_master-1_cidr_block
  vpc_id       = alicloud_vpc.main.id
  zone_id      = var.vswitch_master-1_zone
}

