terraform {
  backend "oss" {
    bucket  = "swill-terraform-state"
    prefix  = "swill"
    key     = "terraform.tfstate"
    acl     = "private"
    region  = "cn-beijing"
    encrypt = "true"
    # Use tablestore Internet access url that you've created
    tablestore_endpoint = "https://xxxxxuxxxxx.cn-beijing.ots.aliyuncs.com"
    tablestore_table    = "swill_terraform_state"
  }
}

