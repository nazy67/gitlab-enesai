### User_data ###
data "template_file" "user_data" {
  template = file("template_file/install_gitlab.yml")
  vars = {
    env = var.env
  }
}