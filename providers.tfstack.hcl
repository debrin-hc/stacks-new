required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.7.2"
  }

  null = {
    source = "hashicorp/null"
    version = "3.2.4"
  }
}

provider "random" "this" {}

provider "null" "this" {}
