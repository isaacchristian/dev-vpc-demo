# main.tf

data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

resource "aws_vpc" "vpc_demo" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.vpc_name
    Environment = "demo_environment"
    Terraform   = "true"
  }
}

resource "aws_subnet" "demo" {
  vpc_id     = aws_vpc.vpc_demo.id
  cidr_block = var.vpc_cidr
  availability_zone = var.availability_zone

  tags = {
    Name        = "demo"
    Environment = "demo-env"
  }
}

resource "aws_internet_gateway" "internet_gateway_demo" {
  vpc_id = aws_vpc.vpc_demo.id
  tags = {
    Name = "demo_igw"
  }
}

resource "aws_instance" "web_demo" {
  ami               = var.ami_type
  instance_type     = "t2.micro"
  availability_zone = var.availability_zone

  subnet_id = aws_subnet.demo.id

  tags = {
    "Name" = "Web Server"
  }
}