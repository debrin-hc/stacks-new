# deployment "development" {}

deployment "staging" {
  inputs = {
    stable_var = store.varset.vars_block.stable.stable_var
  }
}

store "varset" "vars_block" {
  # id = "varset-brfhCsSS6m5axw3E"
  name = "aws_creds"
  category = "env"
}
