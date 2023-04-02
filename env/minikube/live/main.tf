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

module "redis" {
  source       = "../../../modules/redis"
  password = "${var.password}"
}