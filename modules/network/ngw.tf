resource "aws_eip" "eks_ngw_eip_1a" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_1b" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}



resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.comunidadedevops-subnet-pubilc-1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-nat-1a"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_igw]
}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.comunidadedevops-subnet-pubilc-1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-nat-1b"
    }
  )
}



resource "aws_route_table" "eks_private_route_table_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-rtb-private-1a"
    }
  )
}


resource "aws_route_table" "eks_private_route_table_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-rtb-private-1b"
    }
  )
}



resource "aws_route_table_association" "eks_private_route_table_association-1a" {
  subnet_id      = aws_subnet.comunidadedevops-subnet-private-1a.id
  route_table_id = aws_route_table.eks_private_route_table_1a.id
}


resource "aws_route_table_association" "eks_private_route_table_association-1b" {
  subnet_id      = aws_subnet.comunidadedevops-subnet-private-1b.id
  route_table_id = aws_route_table.eks_private_route_table_1b.id
}