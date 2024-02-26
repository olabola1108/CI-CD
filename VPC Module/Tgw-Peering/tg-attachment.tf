provider "aws" {
  alias  = "local"
  region = var.my-region
}

provider "aws" {
  alias  = "peer"
  region = var.peer-region
}

data "aws_caller_identity" "peer" {
  provider = aws.peer
}

data "aws_region" "peer" {
  provider = aws.peer
}

data "aws_region" "local" {
  provider = aws.local
}

data "aws_ec2_transit_gateway" "local" {
  provider = aws.local
  #id = tgw-002239391e659871b
}

data "aws_ec2_transit_gateway" "peer" {
  provider = aws.peer
  #id = tgw-04363cf462af3cdae
}

resource "aws_ec2_transit_gateway_peering_attachment" "Requestor" {
  provider                = aws.local
  peer_account_id         = data.aws_caller_identity.peer.account_id
  peer_region             = data.aws_region.peer.name
  peer_transit_gateway_id = data.aws_ec2_transit_gateway.peer.id
  transit_gateway_id      = data.aws_ec2_transit_gateway.local.id

  tags = {
    Name = "TGW Peering Requestor"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "Accepter" {
  provider                      = aws.peer
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.Requestor.id

  tags = {
    Name = "Cross-region attachment"
  }
}