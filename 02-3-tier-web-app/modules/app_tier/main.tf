/*
    This Tier lies in Private Subnet
    We require:
        - Internal Load Balancer
        - Auto Scaling Group
            - Launch Template
            - AMI
*/


# App Tier : Internal ALB
resource "aws_lb" "my_internal_alb" {
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.sg_internal_alb_id]
  subnets            = toset(var.subnets_private_ids)

  # so we can delete using terrform
  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name} Internal-ALB"
  }
}

# Internal ALB Target Group
resource "aws_lb_target_group" "internal_alb_tg" {
  #   Node JS app lives in 4000
  port     = 4000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  # for internal ALB session maintenance is not required. as it will just serve API
  #   stickiness {
  # type            = "lb_cookie"
  # cookie_duration = 86400
  # enabled         = true
  # }

  health_check {
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
    Name = "${var.project_name} Internal-ALB Target Group"
  }
}

# Internal ALB Listener
resource "aws_lb_listener" "internal_alb_listener" {
  depends_on = [aws_lb.my_internal_alb, aws_lb_target_group.internal_alb_tg]

  load_balancer_arn = aws_lb.my_internal_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.internal_alb_tg.arn
  }

  tags = {
    Name = "${var.project_name} Internal-ALB Listener"
  }
}


## App Tier : Launch Template
resource "aws_launch_template" "lt_app" {
  depends_on    = [var.app_ami_id]
  image_id      = var.app_ami_id
  instance_type = var.app_ec2_type

  iam_instance_profile {
    name = "${var.project_name}-ec2-role"
  }

  # Define block device mappings (for example, an EBS root volume)
  block_device_mappings {
    device_name = var.app_dev_name

    ebs {
      volume_size           = var.app_ebs_vol_size
      volume_type           = var.app_ebs_vol_type
      delete_on_termination = true
    }
  }

  # networking information is set in autoscaling group
  # Terraform Docs:
  # security_group_names - (Optional) A list of security group names to associate with. 
  # If you are creating Instances in a VPC, use vpc_security_group_ids instead.
  # not !:security_group_names = [var.sg_app_tier_name]
  vpc_security_group_ids = [
    var.sg_app_tier_id
  ]

  tags = {
    Name = "${var.project_name} lt_app"
  }

}

## App Tier : Auto Scaling Group
resource "aws_autoscaling_group" "asg_app" {
  depends_on = [aws_launch_template.lt_app, aws_lb_target_group.internal_alb_tg]
  name       = "${var.project_name} ASG_App_Tier"

  min_size         = var.app_asg_min
  desired_capacity = var.app_asg_desired
  max_size         = var.app_asg_max

  # private subnets of our VPC
  vpc_zone_identifier = toset(var.subnets_private_ids)

  target_group_arns = [aws_lb_target_group.internal_alb_tg.arn]

  # Health check settings
  #   ASG will considered instance healthy based on ALB
  # ELB as we will use internal load balancer
  health_check_type         = var.app_asg_health_check_type
  health_check_grace_period = 300


  launch_template {
    id = aws_launch_template.lt_app.id
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name} ASG_App_Tier"
    propagate_at_launch = false
  }

}

## App Tier : Scaling Policy : Target Tracking (CPU) : scale out & in
resource "aws_autoscaling_policy" "app_scale_out_policy" {
  depends_on             = [aws_autoscaling_group.asg_app]
  name                   = "app-scale-out-policy"
  autoscaling_group_name = aws_autoscaling_group.asg_app.name

  # Error: scaling_adjustment is only supported for policy type SimpleScaling
  # scaling_adjustment = 1
  # Error: cooldown is only supported for policy type SimpleScaling
  # cooldown                = 300
  adjustment_type         = "ChangeInCapacity"
  metric_aggregation_type = "Average"
  policy_type             = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.app_max_threshold
  }

}

resource "aws_autoscaling_policy" "app_scale_in_policy" {
  depends_on             = [aws_autoscaling_group.asg_app]
  name                   = "app-scale-in-policy"
  autoscaling_group_name = aws_autoscaling_group.asg_app.name

  # Error: scaling_adjustment is only supported for policy type SimpleScaling
  #   scaling_adjustment = -1
  # Error: cooldown is only supported for policy type SimpleScaling
  # cooldown                = 300
  policy_type             = "TargetTrackingScaling"
  adjustment_type         = "ChangeInCapacity"
  metric_aggregation_type = "Average"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.app_min_threshold
  }

}

# Attaching ASG to existing Load Balancer
resource "aws_autoscaling_attachment" "asg_attachment_internal_alb" {
  depends_on             = [aws_autoscaling_group.asg_app, aws_lb_target_group.internal_alb_tg]
  autoscaling_group_name = aws_autoscaling_group.asg_app.id
  lb_target_group_arn    = aws_lb_target_group.internal_alb_tg.arn
}

# cloudwatch alarm for App Tier
resource "aws_cloudwatch_metric_alarm" "app_high_cpu_alarm" {
  depends_on          = [aws_autoscaling_group.asg_app]
  alarm_name          = "app-high-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.app_max_threshold
  alarm_description   = "Alarm when CPU utilization of APP Tier is high"
  alarm_actions       = [aws_autoscaling_policy.app_scale_out_policy.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_app.name
  }

  tags = {
    Name = "${var.project_name} App-Tier-CPU-metric-high"
  }
}

resource "aws_cloudwatch_metric_alarm" "app_low_cpu_alarm" {
  depends_on          = [aws_autoscaling_group.asg_app]
  alarm_name          = "app-low-cpu-alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.app_min_threshold
  alarm_description   = "Alarm when CPU utilization of APP Tier is low"
  alarm_actions       = [aws_autoscaling_policy.app_scale_out_policy.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg_app.name
  }

  tags = {
    Name = "${var.project_name} App-Tier-CPU-metric-low"
  }
}
