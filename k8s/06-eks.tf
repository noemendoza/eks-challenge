resource "aws_iam_role" "boletia" {
  name = "eks-cluster-boletia"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "boletia-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.boletia.name
}

resource "aws_eks_cluster" "boletia" {
  name     = "boletia"
  role_arn = aws_iam_role.boletia.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-west-1a.id,
      aws_subnet.private-us-west-1c.id,
      aws_subnet.public-us-west-1a.id,
      aws_subnet.public-us-west-1c.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.boletia-AmazonEKSClusterPolicy]
}
