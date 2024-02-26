# 1. Transit gateway

provider "aws" {
  alias = "remote"
  region = var.region
}

resource "aws_ec2_transit_gateway" "tgw" {
  provider = aws.remote
  description = "Transit Gateway for ${var.environment}"
  amazon_side_asn = 64512
  transit_gateway_cidr_blocks = null

  tags = {
    Name = "${var.environment}-TGW"
  }
}

/*
# 2. TGW Route
resource "aws_ec2_transit_gateway_route" "example" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.example.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway.example.association_default_route_table_id
}

# 3.TGW Route-table
resource "aws_ec2_transit_gateway_route_table" "example" {
  transit_gateway_id = aws_ec2_transit_gateway.example.id
}

# 4.TGW Route-Table Association
resource "aws_ec2_transit_gateway_route_table_association" "example" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.example.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.example.id
}

*/