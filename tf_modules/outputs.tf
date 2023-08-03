output "main_vpc_id" {
  value       = alicloud_vpc.main.id
  description = "vpc id"
}
output "matser-1_vswitch_id" {
  value       = alicloud_vswitch.master-1.id
  description = "vswitch id"
}
