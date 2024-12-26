# Here we are only creating DB Subnet Groups
# Actual DB Cluster will be created using AWS Management Console
# As I am using Aurora, which is not under Free Tier

resource "aws_db_subnet_group" "db_sb_grp" {
  name       = "${var.project_name} db-sb-grp"
  subnet_ids = toset(var.subnets_database_ids)

  description = "DB Subnet Group for RDS DB Cluster"

  tags = {
    Name = "${var.project_name} db-sb-grp"
  }
}
