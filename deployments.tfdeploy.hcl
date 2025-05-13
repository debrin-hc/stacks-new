deployment "development" {
  inputs = {
    pet_prefix = store.varset.prefix.pet_prefix
  }
}

store "varset" "prefix" {
  id = "varset-brfhCsSS6m5axw3E"
  category = "terraform"
}