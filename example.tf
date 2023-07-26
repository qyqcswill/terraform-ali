#
# 
provider "alicloud" {
  region     = "cn-beijing"
}

data "alicloud_instance_types" "c2g4" {
  cpu_core_count = 4
  memory_size    = 8
}

data "alicloud_images" "alios" {
  name_regex  = "^aliyun_2_1903_x64_20G_dengbao_alibase"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "main" {
  vpc_name   = "main-vpc"
  cidr_block = "192.168.0.0/16"
}
resource "alicloud_vswitch" "master-1" {
  vswitch_name = "cn-beijing-a-0"
  cidr_block   = "192.168.1.0/24"
  vpc_id       = alicloud_vpc.main.id
  zone_id      = "cn-beijing-a"
  tags = {
     name = "Terraform"
     role = "test"
  }
}

# Create a web server
resource "alicloud_ecs_instance_set" "web" {
  image_id             = "${data.alicloud_images.alios.images.0.id}"
  internet_charge_type = "PayByBandwidth"

  instance_type        = "${data.alicloud_instance_types.c2g4.instance_types.0.id}"
  system_disk_category = "cloud_efficiency"
  security_group_ids      = ["${alicloud_security_group.default.id}"]
  instance_name        = "web"
  vswitch_id           = "${alicloud_vswitch.master-1.id}"
}

# Create security group
resource "alicloud_security_group" "default" {
  name        = "default"
  description = "default"
  vpc_id      = "${alicloud_vpc.main.id}"
}