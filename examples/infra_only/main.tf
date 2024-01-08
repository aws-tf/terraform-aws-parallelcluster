module "required_infra" {
  source = "../../modules/required_infra"

  prefix               = var.prefix
  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
