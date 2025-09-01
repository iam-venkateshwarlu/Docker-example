resource "aws_vpc" "main" {
  cidr_block = var.cidr
  enable_dns_support = true
  enable_dns_hostnames = true
 
  tags = {
    Name = var.project
  }  
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[0]
  map_public_ip_on_launch = true
  
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id  
  
}
 
 resource "aws_route" "route" {
    route_table_id = aws_route_table.rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
 }

 resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = var.project
    }
 }