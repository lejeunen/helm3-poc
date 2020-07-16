
terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "local" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

provider "helm" {
  version = "~> 1.2.3"
}
resource "helm_release" "prometheus" {
  name = "prometheus"
  chart = "stable/prometheus"
  namespace = "helm3-poc"
  version = "9.3.1"

  values = [<<EOF
rbac:
  create: true
alertmanager:
  enabled: false
pushgateway:
  enabled: false
server:
  ingress:
    enabled: false
  persistentVolume:
    size: 1Gi
  retention: 10d
  baseURL: http://minikube.local/prometheus/
  extraArgs:
    web.route-prefix: /
EOF
  ]
}


resource "kubernetes_ingress" "prometheus" {
  metadata {
    name = "prometheus-ingress"
    namespace = var.app_namespace

    annotations= {
      "nginx.ingress.kubernetes.io/rewrite-target" : "/$2",
    }
  }

  spec {

    rule {
      host = "minikube.local"
      http {

        # prometheus server
        path {
          backend {
            service_name = "prometheus-server"
            service_port = 9090
          }
          path = "/prometheus(/|$)(.*)"
        }

      }
    }
  }

}