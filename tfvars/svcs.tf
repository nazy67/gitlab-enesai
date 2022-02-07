### AWS Provider Region ###
aws_region    = "us-east-1"

### GitLab Server ###
instance_type = "t2.medium"
image_id      = ""
key_name      = ""
associate_pub_ip_addr = true

### GitLab Security Group ###
ssh_ip_ingress     = {
    1 = {from=22, to=22, protocol="tcp", cidr="", desc="allow  home IPv4"},
    2 = {from=22, to=22, protocol="tcp", cidr="", desc="allow  IPv4"},
    3 = {from=22, to=22, protocol="tcp", cidr="", desc="allow  home IPv4"},
    4 = {from=22, to=22, protocol="tcp", cidr="", desc="allow home IPv4"},
    5 = {from=22, to=22, protocol="tcp", cidr="", desc="allow  home IPv4"},
    6 = {from=22, to=22, protocol="tcp", cidr="", desc="allow jenkins public IPv4"},
    7 = {from=22, to=22, protocol="tcp", cidr="", desc="allow dev-app public IPv4"},
    8 = {from=22, to=22, protocol="tcp", cidr="", desc="allow dev-vpc cidr block"}
}

http_ip_ingress     = {
    1 = {from=80, to=80, protocol="tcp", cidr="", desc="allow home IPv4"},
    2 = {from=80, to=80, protocol="tcp", cidr="", desc="allow IPv4"},
    3 = {from=80, to=80, protocol="tcp", cidr="", desc="allow home IPv4"},
    4 = {from=80, to=80, protocol="tcp", cidr="", desc="allow home IPv4"},
    5 = {from=80, to=80, protocol="tcp", cidr="", desc="allow home IPv4"}
}

https_ip_ingress     = {
    1 = {from=443, to=443, protocol="tcp", cidr="", desc="allow IPv4"},
    2 = {from=443, to=443, protocol="tcp", cidr="", desc="allow home IPv4"},
    3 = {from=443, to=443, protocol="tcp", cidr="", desc="allow home IPv4"},
    4 = {from=443, to=443, protocol="tcp", cidr="", desc="allow home IPv4"},
    5 = {from=443, to=443, protocol="tcp", cidr="", desc="allow home IPv4"}
}

icmp_ingress     = {
    1 = {from=-1, to=-1, protocol="icmp", cidr="", desc="allow ICMP bastion"},
    2 = {from=-1, to=-1, protocol="icmp", cidr="", desc="allow ICMP jenkins"},
    3 = {from=-1, to=-1, protocol="icmp", cidr="", desc="allow ICMP plg"}
}

plg_ingress     = {
    1 = {from=9100, to=9100, protocol="tcp", cidr="", desc="allow node_exporter plg private IPv4"}
}

### EBS Volume Variables ###
ebs_availability_zone    = "us-east-1b"
ebs_size                 = "30"
ebs_device_name          = "/dev/xvdf"

### GitLab Tags ###
env           = ""
project_name  = ""
managed_by    = "terraform"
owner         = ""
team          = "infra"
giturl        = ""
backup_name   = ""