component "random" {
  
  source = "./random"
  inputs = {
    pet_prefix = var.pet_prefix
  }

  providers = {
    random = provider.random.this
  }
}
