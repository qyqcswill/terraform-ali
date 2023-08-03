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

data "alicloud_instance_types" "c4g8" {
  cpu_core_count = 4
  memory_size    = 8
}

data "alicloud_images" "alios" {
  name_regex  = "^aliyun_2_1903_x64_20G_dengbao_alibase"
  most_recent = true
  owners      = "system"
}

resource "alicloud_security_group" "default" {
  name        = "default"
  description = "default"
  vpc_id      = module.my_module.main_vpc_id
}
resource "alicloud_instance" "web" {
  image_id             = data.alicloud_images.alios.images.0.id
  internet_charge_type = "PayByBandwidth"
  instance_type        = data.alicloud_instance_types.c4g8.instance_types.0.id
  system_disk_category = "cloud_efficiency"
  security_groups      = ["${alicloud_security_group.default.id}"]
  instance_name        = "web"
  vswitch_id           = module.my_module.matser-1_vswitch_id
}


