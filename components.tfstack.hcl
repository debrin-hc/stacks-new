component "random" {
  
  source = "./random"
  inputs = {
    special_chars = local.special_chars
  }

  providers = {
    random = provider.random.this
  }
}

locals {
  special_chars = var.special_chars
}