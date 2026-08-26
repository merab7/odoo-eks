variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "cluster_name" {
  type    = string
  default = "odoo-test"
}

variable "kubernetes_version" {
  type    = string
  default = "1.34"
}

variable "github_repo" {
  description = "org/repo allowed to assume the CI role, e.g. merab7/odoo-addons"
  type        = string
}

variable "create_github_oidc_provider" {
  description = "false if the account already has the GitHub OIDC provider"
  type        = bool
  default     = true
}
