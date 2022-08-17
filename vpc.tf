resource "aws_vpc" "elk_vpc" {
  cidr_block = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ELK-VPC"
  }
}

module "public" {
    source = "./network-module"

    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.1.0/24"
    subnet_name =  "public_subnet"
    avail_zones = "eu-west-1a"
    is_public   =  true
}

module "private_monitor" {
    source = "./network-module"

    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.2.0/24"
    subnet_name =  "monitor_subnet"
    avail_zones = "eu-west-1a"
}

module "private_app_1a" {
    source = "./network-module"
    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.3.0/24"
    subnet_name =  "App-subnet1a"
    avail_zones = "eu-west-1a"
}

module "private_app_1b" {
    source = "./network-module"
    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.4.0/24"
    subnet_name =  "App-subnet1b"
    avail_zones = "eu-west-1b"
}

module "private_app_1c" {
    source = "./network-module"
    vpc_id  =  aws_vpc.elk_vpc.id 
    subnet_cidr =  "192.168.5.0/24"
    subnet_name =  "App-subnet1c"
    avail_zones = "eu-west-1c"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.elk_vpc.id

  tags = {
    Name = "internet gateway"
  }
}

