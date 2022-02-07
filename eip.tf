resource "aws_eip" "gitlab_eip" {
  provider  = aws.svcs
  instance  = aws_instance.gitlab-server.id
  vpc       = true

  lifecycle {
    prevent_destroy = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}-infra-ue1-glab-eip-main"
    }
  )
}

resource "aws_eip_association" "eip_assoc" {
  provider      = aws.svcs
  instance_id   = aws_instance.gitlab-server.id
  allocation_id = aws_eip.gitlab_eip.id
}