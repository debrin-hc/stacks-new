component "random" {
  
  source = "./random"

  inputs = {
    stable_var = var.stable_var
  }

  providers = {
    random = provider.random.this
    null   = provider.null.this
  }
}
