/*
    This Tier lies in Public Subnet
    We require:
        - External App Load Balancer
        - Auto Scaling Group
            - Launch Template
            - AMI
*/

## App Tier : ALB
resource "aws_lb" "my_alb" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_alb_id]
  subnets            = toset(var.subnets_public_ids)

  enable_deletion_protection = true

  tags = {
    Name = "${var.project_name} ALB"
  }
}

# Internal ALB Target Group
resource "aws_lb_target_group" "alb_tg" {
  # NGINX is listening on port 80
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  # for ALB session maintenance is required. as it will just serve API
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 86400
    enabled         = true
  }

  health_check {
    # /health defined nginx .conf file
    interval            = 30
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200"
  }

  tags = {
    Name = "${var.project_name} ALB Target Group"
  }
}

# ALB Listener
resource "aws_lb_listener" "alb_listener" {
  depends_on = [aws_lb.my_alb, aws_lb_target_group.alb_tg]

  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }

  tags = {
    Name = "${var.project_name} ALB Listener"
  }
}

## Web Tier : Launch Template
resource "aws_launch_template" "lt_web" {
  depends_on    = [var.web_ami_id]
  image_id      = var.web_ami_id
  instance_type = var.web_ec2_type

  # Define block device mappings (for example, an EBS root volume)
  block_device_mappings {
    device_name = var.web_dev_name

    ebs {
      volume_size           = var.web_ebs_vol_size
      volume_type           = var.web_ebs_vol_type
      delete_on_termination = true
    }
  }

  # networking information is set in autoscaling group
  # networking information is set in autoscaling group
  # Terraform Docs:
  # security_group_names - (Optional) A list of security group names to associate with. 
  # If you are creating Instances in a VPC, use vpc_security_group_ids instead.
  # security_group_names = [var.sg_web_tier_name]

  vpc_security_group_ids = [
    var.sg_web_tier_id
  ]

  tags = {
    Name = "${var.project_name} lt_web"
  }

}

## web Tier : Auto Scaling Group
resource "aws_autoscaling_group" "asg_web" {
  depends_on = [aws_launch_template.lt_web, aws_lb_target_group.alb_tg]
  name       = "${var.project_name} ASG_Web_Tier"

  min_size         = var.web_asg_min
  desired_capacity = var.web_asg_desired
  max_size         = var.web_asg_max

  # public subnets of our VPC
  vpc_zone_identifier = toset(var.subnets_public_ids)

  target_group_arns = [aws_lb_target_group.alb_tg.arn]

  # Health check settings
  # ASG will considered instance healthy based on ALB
  # ELB as we will use external Application load balancer
  health_check_type         = var.web_asg_health_check_type
  health_check_grace_period = 300


  launch_template {
    id = aws_launch_template.lt_web.id
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name} ASG_Web_Tier"
    propagate_at_launch = false
  }

}

## web Tier : Scaling Policy : Target Tracking (CPU) : scale out & in
resource "aws_autoscaling_policy" "web_scale_out_policy" {
  depends_on             = [aws_autoscaling_group.asg_web]
  name                   = "web-scale-out-policy"
  autoscaling_group_name = aws_autoscaling_group.asg_web.name

  # Error: cooldown is only supported for policy type SimpleScaling
  # scaling_adjustment      = 1
  # Error: cooldown is only supported for policy type SimpleScaling
  # cooldown                = 300
  adjustment_type         = "ChangeInCapacity"
  metric_aggregation_type = "Average"
  policy_type             = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.web_max_threshold
  }

}

resource "aws_autoscaling_policy" "web_scale_in_policy" {
  depends_on             = [aws_autoscaling_group.asg_web]
  name                   = "web-scale-in-policy"
  autoscaling_group_name = aws_autoscaling_group.asg_web.name

  # Error: scaling_adjustment is only supported for policy type SimpleScaling
  # scaling_adjustment      = -1
  # Error: cooldown is only supported for policy type SimpleScaling
  # cooldown                = 300
  policy_type             = "TargetTrackingScaling"
  adjustment_type         = "ChangeInCapacity"
  metric_aggregation_type = "Average"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.web_min_threshold
  }

}


# cloudwatch alarms for Web Tier
resource "aws_cloudwatch_metric_alarm" "web_high_cpu_alarm" {
  depends_on          = [aws_autoscaling_group.asg_web]
  alarm_name          = "web-high-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.web_max_threshold
  alarm_description   = "Alarm when CPU utilization of WEB Tier is high"
  alarm_actions       = [aws_autoscaling_policy.web_scale_out_policy.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_web.name
  }

  tags = {
    Name = "${var.project_name} Web-Tier-CPU-metric-high"
  }
}

resource "aws_cloudwatch_metric_alarm" "web_low_cpu_alarm" {
  depends_on          = [aws_autoscaling_group.asg_web]
  alarm_name          = "web-low-cpu-alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.web_min_threshold
  alarm_description   = "Alarm when CPU utilization of WEB Tier is low"
  alarm_actions       = [aws_autoscaling_policy.web_scale_in_policy.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_web.name
  }

  tags = {
    Name = "${var.project_name} Web-Tier-CPU-metric-low"
  }
}
