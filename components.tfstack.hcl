component "random" {
  
  source = "./random"
  inputs = {
    special_chars = var.special_chars
  }

  providers = {
    random = provider.random.this
  }
}
