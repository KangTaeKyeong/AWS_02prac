# Application LoadBalancer Deploy
resource "aws_lb" "kang_lb" {
  name                   = "${var.name}-alb"
  internal               = false
  load_balancer_type     = "application"
  security_groups        =  [aws_security_group.kang_websg.id]
  subnets                =  [aws_subnet.kang_pub[0].id,aws_subnet.kang_pub[1].id]
  
  tags = {
    Name  = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "kang_lbtg" {
  name      = "${var.name}-lbtg"
  port      =  var.http_port
  protocol  =  var.http
  vpc_id    =  aws_vpc.kang_vpc.id

  health_check {
    enabled               = true
    healthy_threshold     = var.healthy_threshold
    interval              = var.interval
    matcher               = var.matcher
    path                  = var.lbpath 
    port                  = var.lbport
    protocol              = var.http
    timeout               = var.timeout
    unhealthy_threshold   = var.unhealthy_threshold
  }
}

resource "aws_lb_listener" "kang_lblist" {
  load_balancer_arn       = aws_lb.kang_lb.arn
  port                    = var.http_port
  protocol                = var.http

  default_action {
    type                  = "forward"
    target_group_arn      = aws_lb_target_group.kang_lbtg.arn  
  }
}

resource "aws_lb_target_group_attachment" "kang_lbtg_att" {
  target_group_arn      = aws_lb_target_group.kang_lbtg.arn
  target_id             = aws_instance.kang_weba.id
  port                  = var.http_port 
}