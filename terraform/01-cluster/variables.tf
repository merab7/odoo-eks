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

variable "github_owner_id" {
  description = "Numeric GitHub user/org ID. Required for repos created on/after 2026-07-15, which emit an immutable sub claim. Find it with: curl -s https://api.github.com/users/<owner>"
  type        = string
  default     = ""
}

variable "github_repo_id" {
  description = "Numeric GitHub repository ID. Find it with: curl -s https://api.github.com/repos/<owner>/<repo>"
  type        = string
  default     = ""
}

variable "create_github_oidc_provider" {
  description = "false if the account already has the GitHub OIDC provider"
  type        = bool
  default     = true
}
