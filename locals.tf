locals {
  common_tags = {
    Environment = var.env
    ProjectName = var.project_name
    ManagedBy   = var.managed_by
    Owner       = var.owner
    Team        = var.team
    GitUrl      = var.giturl
  }
}
