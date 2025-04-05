resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}


resource "aws_route_table" "eks_public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-rtb-public"
    }
  )
}


resource "aws_route_table_association" "eks_public_route_table_association-1a" {
  subnet_id      = aws_subnet.comunidadedevops-subnet-pubilc-1a.id
  route_table_id = aws_route_table.eks_public_route_table.id
}


resource "aws_route_table_association" "eks_public_route_table_association-1b" {
  subnet_id      = aws_subnet.comunidadedevops-subnet-pubilc-1b.id
  route_table_id = aws_route_table.eks_public_route_table.id
}