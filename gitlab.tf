resource "aws_instance" "gitlab-server" {
  provider                    = aws.svcs
  depends_on                  = [aws_security_group.glab-sg-svcs]
  ami                         = var.image_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_pub_ip_addr
  subnet_id                   = data.terraform_remote_state.svcs-vpc.outputs.svcs_pubsub_2_id
  vpc_security_group_ids      = [aws_security_group.glab-sg-svcs.id]
  user_data                   = data.template_file.user_data.rendered
  key_name                    = var.key_name

  root_block_device {
    delete_on_termination = true
  }

  # lifecycle {
  #   ignore_changes = false
  # }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.env}-infra-ue1b-ec2glab-main"
      BackupName = var.backup_name
    }
  )
}
