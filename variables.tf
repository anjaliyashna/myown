variable "vpc_ip"{
  description = "In range of VPC"
  type = string
}

variable "private_subnet_ip" {
  description = "Enter the range of private subnet"
  type = string
}

variable "public_subnet_ip" {
  description = "Enter the range of public subnett"
  type = string
}

variable "route_table_ip" {
  description = "Enter the route table ip"
  type = string
}

variable "instance_type"{
  description = "enter instance type"
  type = string
}