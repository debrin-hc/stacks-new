# resource "random_pet" "increase_resource_count" {
#   for_each = { for idx in range(1, 10) : idx => idx }
# 
#   prefix = "pet-${each.key}"
#   length = 2
# }

ephemeral "random_password" "password" {
  length           = 16
  special          = true
  override_special = var.special_chars
}