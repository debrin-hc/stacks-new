component "random" {
  
  source = "./random"

  providers = {
    random = provider.random.this
    null   = provider.null.this
  }
}
