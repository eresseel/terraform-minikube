resource "helm_release" "flask" {
  name       = "flask"
  repository = "https://eresseel.github.io/flask-helm-chart/"
  namespace  = "kube-application"
  chart      = "flask"
  version    = "1.0.0"
  wait       = true

  values = [
    file("${path.module}/values.yaml")
  ]

  set {
    name = "redis.password"
    value = "${var.password}"
  }
}
