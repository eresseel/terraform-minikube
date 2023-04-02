resource "helm_release" "redis" {
  name       = "redis"
  repository = "https://charts.bitnami.com/bitnami"
  namespace  = "kube-application"
  chart      = "redis"
  version    = "17.0.3"
  wait       = true

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name = "auth.password"
    value = "${var.password}"
  }
}
