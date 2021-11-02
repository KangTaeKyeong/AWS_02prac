resource "aws_eip" "lb_ip_a" {
#  instance = aws_instance.web.id
  vpc      = true
}

# resource "aws_eip" "lb_ip_c" {
# #  instance = aws_instance.web.id
#   vpc      = true
# }

resource "aws_nat_gateway" "kang_nga" {

  # count = "${length(var.public_s)}"
  allocation_id = aws_eip.lb_ip_a.id
  subnet_id = aws_subnet.kang_pub[0].id 
  tags = {
    Name = "${var.name}-nga-${var.avazone[0]}"
  }
}



resource "aws_route_table" "kang_ngart" {
  vpc_id  =  aws_vpc.kang_vpc.id
 
  route {
    cidr_block  = var.cidr_0
    gateway_id  = aws_nat_gateway.kang_nga.id
  }
  tags  = {
    Name  = "${var.name}-nga-rt${var.avazone[0]}"
   }
}

resource "aws_route_table_association" "kang_ngartas" {
  subnet_id      = aws_subnet.kang_pri[0].id
  route_table_id = aws_route_table.kang_ngart.id
}