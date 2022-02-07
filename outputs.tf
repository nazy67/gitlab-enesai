### GitLab Server Outputs ###
output "ec2glab_public_ip" {
  value = aws_instance.gitlab-server.public_ip
}
output "ec2glab_state" {
  value = aws_instance.gitlab-server.instance_state
}
output "ec2glab_private_ip" {
  value = aws_instance.gitlab-server.private_ip
}
output "sgglab_id" {
  value = aws_security_group.glab-sg-svcs.id
}

### GitLab EBS Outputs ###
output "gitlab-ebs-001-id" {
  value = aws_ebs_volume.gitlab-ebs-001.id
}
output "gitlab-ebs-001-arn" {
  value = aws_ebs_volume.gitlab-ebs-001.arn
}
output "gitlab-ebs-001-tags" {
  value = aws_ebs_volume.gitlab-ebs-001.tags_all
}