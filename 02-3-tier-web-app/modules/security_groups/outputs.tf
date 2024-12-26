output "sg_alb_id" {
  value = aws_security_group.sg_alb.id
}

output "sg_web_tier_id" {
  value = aws_security_group.sg_web_tier.id
}
output "sg_web_tier_name" {
  value = aws_security_group.sg_web_tier.name
}

output "sg_internal_alb_id" {
  value = aws_security_group.sg_internal_alb.id
}

output "sg_app_tier_id" {
  value = aws_security_group.sg_app_tier.id
}
output "sg_app_tier_name" {
  value = aws_security_group.sg_app_tier.name
}

output "sg_db_tier_id" {
  value = aws_security_group.sg_db_tier.id
}
