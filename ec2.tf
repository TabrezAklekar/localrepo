# main.tf

# Specify the AWS provider
provider "aws" {
  region = "us-east-1" # North Virginia
}

# Create an EC2 instance in the default VPC
resource "aws_instance" "my_instance" {
  ami           = "ami-0e001c9271cf7f3b9" # Replace this with your desired AMI ID
  instance_type = "t2.micro"              # t2.micro instance type
  key_name      = "chabi"                 # Use the existing key pair named "chabi"
  vpc_security_group_ids = ["sg-0d933e4767d0446d5"] # Use the specified security group ID

#   User data script
  user_data = <<-EOF
                !/bin/bash
                echo "ClientAliveInterval 50" >> /etc/ssh/sshd_config
                echo "ClientAliveCountMax 10" >> /etc/ssh/sshd_config
                systemctl restart sshd
              EOF

  tags = {
    Name = "MyEC2Instance"
  }
}

# Output the instance's public IP
output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}

# Output the instance's private IP
output "instance_private_ip" {
  value = aws_instance.my_instance.private_ip
}

# trying to merge with git now