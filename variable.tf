# variable.tf

variable "aws_region" {
  type    = string
  default = "us-west-2a"
}

variable "availability_zone" {
  type    = string
  default = "us-west-2a"
}

variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "ami_type" {
  type    = string
  default = "ami-023e152801ee4846a"
}