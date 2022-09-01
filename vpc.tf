# create vpc
data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
 enable_dns_hostnames = "true"

  tags = {
    Name = "stage-vpc",
    Terraform = "True",
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "stage-igw"
  }


depends_on = [
    aws_vpc.vpc
]
}



resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.1.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = data.aws_availability_zones.available[0].name

tags = {
    Name = "public-1-subnet"
  }
}



# resource "aws_subnet" "public" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "10.1.1.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone = "ap-southeast-1a"

#   tags = {
#     Name = "public-2-subnet"
#   }
# }



# resource "aws_subnet" "public" {
#   vpc_id     = aws_vpc.vpc.id
#   cidr_block = "10.1.2.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone = 

#   tags = {
#     Name = "public-3-subnet"
#   }
# }