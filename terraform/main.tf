provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "strapi" {
  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "strapi-key"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start
              usermod -aG docker ec2-user

              docker pull ${var.image}
              docker run -d -p 80:1337 ${var.image}
              EOF

  tags = {
    Name = "Strapi-Server"
  }
}
