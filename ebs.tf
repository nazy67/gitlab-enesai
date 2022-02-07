### Gitlab EBS Volume ###
resource "aws_ebs_volume" "gitlab-ebs-001" {
   provider          = aws.svcs
   availability_zone = var.ebs_availability_zone
   size              = var.ebs_size
   encrypted         = true

  tags = merge(
     local.common_tags,
     {
       Name = "${var.env}-infra-ue1b-glab-ebs-001"
     }
   )
}

### GitLab EBS Volume Attachment ###
resource "aws_volume_attachment" "ebs_attachment" {
   provider    = aws.svcs
   depends_on  = [aws_ebs_volume.gitlab-ebs-001]
   device_name = var.ebs_device_name
   volume_id   = aws_ebs_volume.gitlab-ebs-001.id
   instance_id = aws_instance.gitlab-server.id
}