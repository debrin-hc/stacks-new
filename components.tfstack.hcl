component "random" {
  
  source = "./random"
  inputs = {
    special_chars = store.varset.prefix.special_chars
  }

  providers = {
    random = provider.random.this
  }
}

store "varset" "prefix" {
  id = "varset-brfhCsSS6m5axw3E"
  category = "terraform"
}