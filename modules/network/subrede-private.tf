resource "aws_subnet" "comunidadedevops-subnet-private-1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.region_current.name}a"

  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-subnet-private-1a",
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "comunidadedevops-subnet-private-1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.region_current.name}b"

  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-subnet-private-1b",
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}