resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vcp_boletia.id

  tags = {
    Name = "igw"
  }
}
