variable "vpc_id" {
  description = "The VPC ID to use in this module"
}

variable "subnet_cidr" {
  description = "The subnet CIDR value"
}

variable "subnet_name" {
  description  =  "The TAG name of the subnet"
}

variable "avail_zones" {
  description  =  "The availability zones"
}

variable "is_public" {
  default = false
  description = "Subnet is public or private True or False"
}