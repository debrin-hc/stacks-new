component "random" {
  
  source = "./random"

  providers = {
    random = provider.random.this
  }
}
