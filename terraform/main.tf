resource "aws_instance" "microk8s" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.mykeypair.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",  # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = "ubuntu
    private_key = file(key)
  }
}
