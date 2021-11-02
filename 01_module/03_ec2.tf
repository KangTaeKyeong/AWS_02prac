resource "aws_security_group" "kang_websg" {
  name        = "Allow-WEB"
  description = "http-ssh-icmp"
  vpc_id      = aws_vpc.kang_vpc.id

  ingress = [
    {
      description       = "ssh"
      from_port         = var.ssh
      to_port           = var.ssh
      protocol          = var.TCP
      cidr_blocks       = [var.cidr_0]
      ipv6_cidr_blocks  = [var.ipcidr]
      security_groups   =  null
      prefix_list_ids   =  null
      self              =  null
    },
    {
      description     = "http"
      from_port       = var.http_port
      to_port         = var.http_port
      protocol        = var.TCP
      cidr_blocks      = [var.cidr_0]
      ipv6_cidr_blocks  = [var.ipcidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    },
    {
      description     = "icmp"
      from_port       = var.icmp_prot
      to_port         = var.icmp_prot
      protocol        = var.icmp
      cidr_blocks      = [var.cidr_0]
      ipv6_cidr_blocks  = [var.ipcidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    },
    {
      description     = "mysql"
      from_port       = var.mysql_port
      to_port         = var.mysql_port
      protocol        = var.TCP
      cidr_blocks      = [var.cidr_0]
      ipv6_cidr_blocks  = [var.ipcidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    }
  ]

   egress = [
     {
      description     = "All"
      from_port        = 0
      to_port          = 0
      protocol         = var.icmp_prot
      cidr_blocks      = [var.cidr_0]
      ipv6_cidr_blocks = [var.ipcidr]
      security_groups  =  null
      prefix_list_ids  =  null
      self             =  null
    }
   ]
  tags = {
    Name = "${var.name}-sg"
  }
} 

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "kang_weba" {
  ami                    = "ami-0e4a9ad2eb120e054"                             #data.aws_ami.amzn.id
  instance_type          = var.t2micro
  key_name               = var.keyname
  vpc_security_group_ids = [aws_security_group.kang_websg.id]
  availability_zone      = "${var.region}${var.avazone[0]}"
  private_ip             = var.private_ip
  subnet_id              = aws_subnet.kang_pub[0].id
  user_data              = file("./${var.sh}") 

  tags = {
    Name = "${var.name}-weba"
  }
}
resource "aws_eip" "kang_web_eip" {
  vpc = true
  instance                    = aws_instance.kang_weba.id
  associate_with_private_ip   = var.private_ip
  depends_on                  = [aws_internet_gateway.kang_ig]
}