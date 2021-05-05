provider "aws" {
  region = "us-east-2"
}
resource "aws_vpc" "example1" {
  cidr_block = var.vpc_ip
}
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.example1.id}"
}
resource "aws_subnet" "example1" {
  vpc_id     = "${aws_vpc.example1.id}"
  cidr_block = var.private_subnet_ip
}
resource "aws_subnet" "example2" {
  vpc_id     = "${aws_vpc.example1.id}"
  cidr_block = var.public_subnet_ip
map_public_ip_on_launch   = "true"

  tags = {
    Name = "Main1"
  }
}

resource "aws_route_table_association" "a" {
  route_table_id = "${aws_route_table.route_table.id}"
  subnet_id = "${aws_subnet.example2.id}"
}

resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.example1.id}"

  route {
    cidr_block = var.route_table_ip
    gateway_id = "${aws_internet_gateway.ig.id}"
  
