module "remote_state" {
  source                    = "terraform-alicloud-modules/remote-backend/alicloud"
  create_backend_bucket     = true
  create_ots_lock_instance  = true
  create_ots_lock_table     = true
  region                    = "cn-beijing"
  state_name                = "terraform.tfstate"
  encrypt_state             = true
  backend_ots_lock_instance = "swill-tf-ots"
}

# Copy from terraform.tf.sample
terraform {
  backend "oss" {
    bucket              = "terraform-remote-backend-c08b3cf9-aba8-10b8-7e3a-d76f979f3cdf"
    prefix              = ""
    key                 = "terraform.tfstate"
    acl                 = "private"
    region              = "cn-beijing"
    encrypt             = "true"
    tablestore_endpoint = "https://swill-tf-ots.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "terraform_remote_backend_lock_table_c08b3cf9_aba8_10b8_7e3a_d76f979f3cdf"
  }
}
