resource "aws_subnet" "private-us-west-1a" {
  vpc_id            = aws_vpc.vcp_boletia.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = "us-west-1a"

  tags = {
    "Name"                            = "private-us-west-1a"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/boletia"      = "owned"
  }
}

resource "aws_subnet" "private-us-west-1c" {
  vpc_id            = aws_vpc.vcp_boletia.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "us-west-1c"

  tags = {
    "Name"                            = "private-us-west-1c"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/boletia"      = "owned"
  }
}

resource "aws_subnet" "public-us-west-1a" {
  vpc_id                  = aws_vpc.vcp_boletia.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-west-1a"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/boletia" = "owned"
  }
}

resource "aws_subnet" "public-us-west-1c" {
  vpc_id                  = aws_vpc.vcp_boletia.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-us-west-1c"
    "kubernetes.io/role/elb"     = "1"
    "kubernetes.io/cluster/boletia" = "owned"
  }
}
