terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "local" {}

  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

provider "helm" {
  version = "~> 1.2.3"
}

# helm3-poc repository must have been defined
resource "helm_release" "hello_v3" {
  name = "hello-v3"
  chart = "helm3-poc/hello-v3"
  namespace = var.app_namespace
  version = var.chart_version
}
