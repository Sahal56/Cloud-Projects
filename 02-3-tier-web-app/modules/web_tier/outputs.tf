output "my_internal_alb_id" {
  value = aws_lb.my_alb.id
}

output "aws_launch_template_id" {
  value = aws_launch_template.lt_web.id
}
