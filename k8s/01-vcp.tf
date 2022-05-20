
resource "aws_vpc" "vcp_boletia" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vcp_boletia"
  }
}