resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = tls_private_key.demo_key.public_key_openssh
# Store private key :  Generate and save private key(aws_keys_pairs.pem) in current directory
  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.demo_key.private_key_pem}' > aws_keys_pairs.pem
      chmod 400 aws_keys_pairs.pem
    EOT
  }
}
