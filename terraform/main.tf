resource "aws_instance" "strapi" {
  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"
  key_name      = "strapi-key" # <-- change if needed

  vpc_security_group_ids = [aws_security_group.strapi_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start
              usermod -aG docker ec2-user

              docker pull ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/REPO:latest
              docker run -d -p 80:1337 ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/REPO:latest
              EOF

  tags = {
    Name = "Strapi-Server"
  }
}

# Security Group
resource "aws_security_group" "strapi_sg" {
  name = "strapi-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
