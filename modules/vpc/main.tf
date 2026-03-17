resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "vpc-${var.region}"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = "${var.region}${element(["a","b","c"], count.index)}"

  tags = {
    Name = "public-${count.index}-${var.region}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = "${var.region}${element(["a","b","c"], count.index)}"

  tags = {
    Name = "private-${count.index}-${var.region}"
  }
}