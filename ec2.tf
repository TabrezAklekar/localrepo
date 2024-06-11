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
}