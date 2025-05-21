resource "random_pet" "increase_resource_count" {
  for_each = { for idx in range(1, 20) : idx => idx }

  prefix = "pet-${each.key}"
  length = 2
}

resource "null_resource" "example" {
  # Using triggers to force execution on every apply
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "echo This specific command will execute every time during apply as triggers are used"
  }
}
