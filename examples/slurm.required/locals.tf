locals {
  config_vars = {
    subnet   = module.pcluster.public_subnets[0].id
    key_pair = module.pcluster.key_pair.id
    region   = var.region
  }
}
