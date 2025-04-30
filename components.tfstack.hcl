# component "vpc" {
#   source = "./modules/vpc"

#   inputs = {
#     name_suffix = var.name_suffix
#   }

#   providers = {
#     aws = provider.aws.this
#   }
# }

# component "instance" {
#   source = "./modules/instance"

#   inputs = {
#     name_suffix = var.name_suffix
#     vpc_id      = component.vpc.vpc_id
#   }

#   providers = {
#     aws = provider.aws.this
#   }
# }

component "s3_bucket" {
  source = "./modules/random"

  providers = {
    random = provider.random.this
  }
}

