variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "node_instance_type" {
  description = "EKS node instance type"
  type        = string
}

variable "desired_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "public_subnet_ids" {
  type = list(string)
}