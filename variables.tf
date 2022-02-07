### AWS Provider Variables ###
variable "aws_region" {
  type        = string
  description = "aws region to deploy your infra"
}

### SVCS Account Numbers ###
variable "svcs_account" {
  type        = string
  description = "shared services account id"
  default     = ""
}

### GitLab Server Variables ###
variable "instance_type" {
  description = "instance type"
  type        = string
}

variable "image_id" {
  description = "image id CentOS7"
  type        = string
}

variable "associate_pub_ip_addr" {
  type        = bool
  description = "associate public ip address"
}

variable "key_name" {
  type        = string
  description = "ssh key name for bastion host"
}

### EBS Volume  Variables ###
variable "ebs_availability_zone" {
  type        = string
  description = "ebs availability zone"
}
variable "ebs_size" {
  type        = string
  description = "ebs size in gb"
}
variable "ebs_device_name" {
  type        = string
  description = "ebs name"
}

### GitLab Security Group Variables ###
variable "ssh_ip_ingress" {
  type        = map(map(any))
  description = "allow traffic on port 22 from listed IPs" 
}
variable "http_ip_ingress" {
  type        = map(map(any))
  description = "allow traffic on port 80 from listed IPs"
}

variable "https_ip_ingress" {
  type        = map(map(any))
  description = "allow traffic on port 443 from listed IPs"
}

variable "icmp_ingress" {
  type        = map(map(any))
  description = "allow icmp traffic to listed IPs"
}

variable "plg_ingress" {
  type        = map(map(any))
  description = "allow traffic from PLG server"
}

### GitLab Tag Variables ###
variable "env" {
  type        = string
  description = "name of the environment"
}

variable "project_name" {
  type        = string
  description = "name of the project"
}

variable "managed_by" {
  type        = string
  description = "managed by terraform, cloudformation or manual"
}

variable "owner" {
  type        = string
  description = "owner of the resource"
}

variable "team" {
  type        = string
  description = "team infra or app"
}

variable "giturl" {
  type        = string
  description = "giturl to the template"
}

variable "backup_name" {
  type        = string
  description = "AWS Backend tag name"
}