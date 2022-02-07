### Gitlab A Record ###
resource "aws_route53_record" "gitlab_a_record" {
  provider = aws.svcs
  zone_id  = data.terraform_remote_state.dns_enesai.outputs.tools_hz_id
  name     = ""
  type     = "A"
  ttl      = "300"
  records  = [aws_instance.gitlab-server.public_ip]
}
