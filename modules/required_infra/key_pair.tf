#####################
## KEY PAIRs ########
#####################

resource "aws_key_pair" "key_pair" {
  key_name_prefix = var.prefix
  public_key      = trimspace(tls_private_key.key.public_key_openssh)

  tags = {}
}

resource "tls_private_key" "key" {
  algorithm = "ED25519"
}
