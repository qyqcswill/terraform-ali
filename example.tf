provider "alicloud" {
  region = "cn-beijing"
}

module "my_module" {
  source                      = "./tf_modules"
  vpc_main_name               = "main"
  vpc_main_cidr_block         = "192.168.0.0/16"
  vswitch_master-1_name       = "master-1"
  vswitch_master-1_cidr_block = "192.168.0.0/24"
  vswitch_master-1_zone       = "cn-beijing-a"
}


