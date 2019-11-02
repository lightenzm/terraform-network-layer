resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_internet_gateway" "vpc" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_nat_gateway" "gw" {
    allocation_id = "${aws_eip.nat_eip.id}"
    subnet_id = "${element(aws_subnet.public.*.id, 0)}"

    depends_on = [ "aws_internet_gateway.vpc" ]
}

