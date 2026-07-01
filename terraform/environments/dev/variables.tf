variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "node_instance_type" {
  type = string
}

variable "min_size" {
  type = number
}

variable "desired_size" {
  type = number
}

variable "max_size" {
  type = number
}