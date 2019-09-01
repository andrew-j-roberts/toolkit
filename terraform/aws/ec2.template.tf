resource "aws_instance" "__NODE_PREFIX__-__NODE_NAME__" {
  ami                     = ""
  instance_type           = ""
  key_name                = "${var.aws_ssh_key_name}"
  vpc_security_group_ids  = [""]
  subnet_id               = ""

  tags = {
    Name     = "__NODE_PREFIX__-__NODE_NAME__"
    Owner    = "" 
    Project  = ""
  }
}