### GitLab security group ###
resource "aws_security_group" "glab-sg-svcs" {
  provider    = aws.svcs
  name        = "${var.env}-infra-ue1-sgglab"
  description = "Allow inbound traffic from listed IPs below"
  vpc_id      = data.terraform_remote_state.svcs-vpc.outputs.svcs_vpc_id
  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}-infra-ue1-sgglab"
    }
  )
}

### Ingress rule allow traffic from svcs tools jenkins ###
resource "aws_security_group_rule" "tools_from_jen_ingress" {
  provider                 = aws.svcs
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 22
  to_port                  = 22
  description              = "allow traffic from jenkins sg"
  source_security_group_id = data.terraform_remote_state.svcs-jen.outputs.sgjen_id
  security_group_id        = aws_security_group.glab-sg-svcs.id
}

### Ingress rule allow traffic from svcs tools gitlab ###
resource "aws_security_group_rule" "tools_from_bast_ingress" {
  provider                 = aws.svcs
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = 22
  to_port                  = 22
  description              = "allow traffic from bastion sg"
  source_security_group_id = data.terraform_remote_state.svcs-bast.outputs.sgbast_id
  security_group_id        = aws_security_group.glab-sg-svcs.id
}

### Ingress rule ssh from home IPs ###
resource "aws_security_group_rule" "ssh_ip_ingress" {
  provider          = aws.svcs
  for_each          = var.ssh_ip_ingress
  type              = "ingress"
  protocol          = each.value.protocol
  from_port         = each.value.from
  to_port           = each.value.to
  description       = each.value.desc
  cidr_blocks       = [each.value.cidr]
  security_group_id = aws_security_group.glab-sg-svcs.id
}

### Ingress rule SMTP to all ###
resource "aws_security_group_rule" "smtp_ingress" {
  provider          = aws.svcs
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 587
  to_port           = 587
  description       = "allow smtp port for outlook email"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.glab-sg-svcs.id
}

### Ingress rule http from home IPvs ###
resource "aws_security_group_rule" "http_ip_ingress" {
  provider          = aws.svcs
  for_each          = var.http_ip_ingress
  type              = "ingress"
  protocol          = each.value.protocol
  from_port         = each.value.from
  to_port           = each.value.to
  description       = each.value.desc
  cidr_blocks       = [each.value.cidr]
  security_group_id = aws_security_group.glab-sg-svcs.id
}

### Ingress rule https from IPvs ###
resource "aws_security_group_rule" "https_ip_ingress" {
  provider          = aws.svcs
  for_each          = var.https_ip_ingress
  type              = "ingress"
  protocol          = each.value.protocol
  from_port         = each.value.from
  to_port           = each.value.to
  description       = each.value.desc
  cidr_blocks       = [each.value.cidr]
  security_group_id = aws_security_group.glab-sg-svcs.id
}

### Ingress ICMP Rule from listed IPv4s ###
resource "aws_security_group_rule" "icmp_ingress" {
  provider          = aws.svcs
  for_each          = var.icmp_ingress
  type              = "ingress"
  protocol          = each.value.protocol
  from_port         = each.value.from
  to_port           = each.value.to
  description       = each.value.desc
  cidr_blocks       = [each.value.cidr]
  security_group_id = aws_security_group.glab-sg-svcs.id
}

### Ingress PLG Rule ###
resource "aws_security_group_rule" "plg_ingress" {
  provider          = aws.svcs
  for_each          = var.plg_ingress
  type              = "ingress"
  protocol          = each.value.protocol
  from_port         = each.value.from
  to_port           = each.value.to
  description       = each.value.desc
  cidr_blocks       = [each.value.cidr]
  security_group_id = aws_security_group.glab-sg-svcs.id
}

### Egress rule allow all ###
resource "aws_security_group_rule" "gitlab_egress" {
  provider          = aws.svcs
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.glab-sg-svcs.id
}