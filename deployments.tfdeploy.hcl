deployment "development" {
  inputs = {
    special_chars = store.varset.prefix.special_chars
  }
}

store "varset" "prefix" {
  id = "varset-brfhCsSS6m5axw3E"
  category = "terraform"
}