resource "aws_db_instance" "kang_mydb" {
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  name                    = var.dbname
  identifier              = var.identifier
  username                = var.dbusername
  password                = var.dbpasswd
  parameter_group_name    = var.parameter_group_name
  availability_zone       = "${var.region}${var.avazone[0]}"
  db_subnet_group_name    = aws_db_subnet_group.kang_dbsn.id
  vpc_security_group_ids  = [aws_security_group.kang_websg.id]
  skip_final_snapshot     = true
  tags = {
      Name = "${var.name}-mydb"
  }
}

resource "aws_db_subnet_group" "kang_dbsn" {
  name  =   "${var.name}-group"
  # count = "${length(var.private_dbs)}"
  # subnet_id = aws_subnet.private_dbs[0].id
  # subnet_id = aws_subnet.kang_pridb[0].id
  subnet_ids = [aws_subnet.kang_pridb[0].id,aws_subnet.kang_pridb[1].id]
  tags = {
      Name = "${var.name}-group"
  }
}