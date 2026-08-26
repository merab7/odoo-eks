resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version
  namespace        = "argocd"
  create_namespace = true

  # Test tier: single replicas, no HA.
  values = [yamlencode({
    global = {
      domain = "argocd.local"
    }
    configs = {
      params = {
        "server.insecure" = true # we reach it via port-forward, not an ALB
      }
    }
    controller     = { replicas = 1 }
    repoServer     = { replicas = 1 }
    server         = { replicas = 1 }
    applicationSet = { replicas = 1 }
  })]

  # Argo CD should self-manage after bootstrap; don't let Terraform fight it.
  lifecycle {
    ignore_changes = [values]
  }
}
