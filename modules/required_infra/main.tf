/**
 *  Copyright 2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"). You may not
 *  use this file except in compliance with the License. A copy of the License is
 *  located at
 *
 *  http://aws.amazon.com/apache2.0/
 *
 *  or in the "LICENSE.txt" file accompanying this file. This file is distributed
 *  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
 *  implied. See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 *  # Required Infrastructure Submodule
 *  The required infra submodule deploys a vpc, subnets, routes, gateways, and creates a
 *  key pair. These are necessary resources for the API to deploy and manage clusters.
 */

##########################
## VPCs ##################
##########################

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr_block // Default "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.prefix}vpc"
  }
}


##########################
## SUBNETs ###############
##########################

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  count                   = length(var.public_subnet_cidrs)
  cidr_block              = var.public_subnet_cidrs[count.index] // Default "10.0.111.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.public_subnet_az

  tags = {
    Name = "${var.prefix}public-${count.index}"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.private_subnet_cidrs)
  cidr_block        = var.private_subnet_cidrs[count.index] // Default "10.0.111.0/24"
  availability_zone = var.private_subnet_az

  tags = {
    Name = "${var.prefix}private-${count.index}"
  }
}


##########################
## GATEWAYs ##############
##########################

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "${var.prefix}nat"
  }
}

resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}internet-gateway"
  }
}


##########################
## ROUTE TABLES ##########
##########################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "${var.prefix}public-route-table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${var.prefix}private-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
