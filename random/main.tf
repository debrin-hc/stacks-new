resource "random_pet" "increase_resource_count" {
  for_each = { for idx in range(1, 20) : idx => idx }

  prefix = "pet-${each.key}"
  length = 2
}
