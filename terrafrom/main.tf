provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "devops_sg" {

  name = "devops-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "devops_sg" {

  ami           = "ami-01b40e1bcccae197a"
  instance_type = "t2.micro"

  key_name = "devops_sg"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = file("userdata.sh")

  user_data_replace_on_change = true

  tags = {
    Name = "devops-server"
  }
}
