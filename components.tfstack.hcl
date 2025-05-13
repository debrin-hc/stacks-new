component "random" {
  
  source = "./random"
  inputs = {
    special_chars = store.varset.prefix.special_chars
  }

  providers = {
    random = provider.random.this
  }
}
