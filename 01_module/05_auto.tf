resource "aws_ami_from_instance" "kang_ami" {
  name                    = "${var.name}-ami"
  source_instance_id      = aws_instance.kang_weba.id
  depends_on = [
    aws_instance.kang_weba
  ]
}

resource "aws_launch_configuration" "kang_lacf" {
  name                 = "${var.name}-web"
  image_id             = aws_ami_from_instance.kang_ami.id
  instance_type        = var.t2micro
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.kang_websg.id]
  key_name             = var.keyname
  user_data            = file("./${var.sh}")
  lifecycle {
    create_before_destroy  = true
  }
}

resource "aws_placement_group" "kang_pg" {
  name     = "${var.name}-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "kang_atsg" {
  name                      = "${var.name}-atsg"
  min_size                  = var.min_size
  max_size                  = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = true
  launch_configuration      = aws_launch_configuration.kang_lacf.name
  vpc_zone_identifier       = [aws_subnet.kang_pub[0].id,aws_subnet.kang_pub[1].id]
}

resource "aws_autoscaling_attachment" "kang_atatt" {
  autoscaling_group_name = aws_autoscaling_group.kang_atsg.id
  alb_target_group_arn   = aws_lb_target_group.kang_lbtg.arn
}