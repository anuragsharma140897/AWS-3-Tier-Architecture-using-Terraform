resource "aws_instance" "web" {
  ami                         = "ami-07d9b9ddc6cd8dd30"
  instance_type               = "t2.micro"
  key_name                    = "ec2-key"
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = "WebServer"
  }

  provisioner "file" {
    source      = "./ec2-key.pem"
    destination = "/home/ec2-user/ec2-key.pem"

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("../ec2-key.pem")
    }
  }
}

resource "aws_instance" "db" {
  ami                    = "ami-07d9b9ddc6cd8dd30"
  instance_type          = "t2.micro"
  key_name               = "ec2-key"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}
