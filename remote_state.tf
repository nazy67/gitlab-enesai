### Remote state of svcs-vpc ###
data "terraform_remote_state" "svcs-vpc" {
  backend = "s3"
  config = {
    bucket = ""
    key    = ""
    region = "us-east-1"
  }
}

### Remote state of svcs-bastion ###
data "terraform_remote_state" "svcs-bast" {
  backend = "s3"
  config = {
    bucket = ""
    key    = ""
    region = "us-east-1"
  }
}

### Remote state of svcs-jenkins ###
data "terraform_remote_state" "svcs-jen" {
  backend = "s3"
  config = {
    bucket = ""
    key    = ""
    region = "us-east-1"
  }
}

### Remote state of dns/enesai ###
data "terraform_remote_state" "dns_enesai" {
  backend = "s3"
  config = {
    bucket = ""
    key    = ""
    region = "us-east-1"
  }
}
