resource "aws_security_group" "default" {
  count       = var.security_group_id == "" ? 1 : 0
  name_prefix = "${var.name}-Client-VPN"
  description = "security group allowing egress for client-vpn users"
  vpc_id      = var.vpc_id
  ingress {
    description      = "Allow all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name               = "${var.name}-Client-VPN"
    EnvName            = var.name
    Service            = "client-vpn"
    TerraformWorkspace = terraform.workspace
  }
}
