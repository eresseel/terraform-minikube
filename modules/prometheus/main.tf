resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  namespace  = "kube-monitoring"
  chart      = "prometheus"
  version    = "20.0.2"
  wait       = true

  values = [
    file("${path.module}/values.yaml")
  ]
}
