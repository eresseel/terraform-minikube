resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  namespace  = "kube-monitoring"
  chart      = "grafana"
  version    = "6.52.4"
  wait       = true

  values = [
    file("${path.module}/values.yaml")
  ]
}