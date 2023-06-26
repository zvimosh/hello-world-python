resource "aws_instance" "microk8s" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t3.medium"
  key_name      = aws_key_pair.mykeypair.key_name
  vpc_security_group_ids = [aws_security_group.allow-ssh.id,aws_security_group.allow-nodeports.id]
  root_block_device {
    delete_on_termination = true
    iops = 100
    volume_size = 40
    volume_type = "gp2"
  }
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
    user        = "ubuntu"
    private_key = tls_private_key.demo_key.private_key_openssh
  }
  tags = {
    Name = "MicroK8s"
  }
}

output "ip" {
  value = aws_instance.microk8s.public_ip  
}
output "key" {
  sensitive = true
  value = tls_private_key.demo_key.private_key_openssh
}

