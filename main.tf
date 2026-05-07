
resource "aws_vpc" "terraform_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "clc15-tf-vpc"
  }
}

resource "aws_subnet" "subnet_public_1a" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-tf-subnet-1a"
  }
}

resource "aws_subnet" "subnet_private_1a" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.100.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-tf-subnet-1a"
  }
}

resource "aws_subnet" "subnet_public_1b" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "public-tf-subnet-1b"
  }
}

resource "aws_subnet" "subnet_private_1b" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.200.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-tf-subnet-1b"
  }
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "tf-vpc-igw"
  }
}

resource "aws_route_table" "tf_public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  tags = {
    Name = "tf-public-rt"
  }
}