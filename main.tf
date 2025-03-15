provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

# Create an EC2 instance
resource "aws_instance" "monitoring_instance" {
  ami           = "ami-08b5b3a93ed654d19" # Change based on your region
  instance_type = "t2.micro"
  key_name      = "tatendaKeypair"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "MonitoringEC2"
  }
}

# Security Group for EC2
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow SSH and necessary ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (consider restricting)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
