resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = tls_private_key.demo_key.public_key_openssh
}
