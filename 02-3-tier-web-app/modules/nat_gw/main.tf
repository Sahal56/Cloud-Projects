# NAT GW
# - it needs Elastic IP
# - It is not free/ not under free tier. So use it wisely
# - charged based hourly + GB transfered
# - (compared to NAT instance)but yes nothing to manage sec grps, user-data, literally just provision by giving it EIP


# HEYYYYYY => CHECK AZ of AURORA & EC2 | modify subnet_id accordingly
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  depends_on    = [aws_eip.nat_eip]
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.subnet_id_NAT

  tags = {
    Name = "${var.project_name} NAT-GW"
  }
}

variable "project_name" {
  type = string
}
