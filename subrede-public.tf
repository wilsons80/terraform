resource "aws_subnet" "comunidadedevops-subnet-pubilc-1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.region_current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-subnet-pubilc-1a",
      "Kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "comunidadedevops-subnet-pubilc-1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.region_current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-subnet-pubilc-1b",
      "Kubernetes.io/role/elb" = 1
    }
  )
}