variable "namespace_names" {
  type        = set(string)
  default     = ["application", "monitoring"]
}

resource "kubernetes_namespace" "minikube" {
  for_each = var.namespace_names

  metadata {
    name = "kube-${each.value}"
  }
}

module "flask" {
  source = "../../../modules/flask"
  password = "${var.password}"
}

module "redis" {
  source   = "../../../modules/redis"
  password = "${var.password}"
}

module "prometheus" {
  source = "../../../modules/prometheus"
}

module "grafana" {
  source = "../../../modules/grafana"
}