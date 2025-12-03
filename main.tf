provider "aws" {
  region = "us-west-1"
}

resource "aws_security_group" "static-web-sg" {
  name = "static-web-sg"
  description = "Allow HTTP and HTTPS traffic"
  ingress  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
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
resource "aws_instance" "Myweb" {
  ami           = "ami-0e6a50b0059fd2cc3"
  instance_type = "t2.micro"
  key_name      = var.key_name
  user_data = file("data.sh")
  vpc_security_group_ids = [aws_security_group.sw_sg.id]
  tags = {
    Name = "static-web-server"
  }  
 }