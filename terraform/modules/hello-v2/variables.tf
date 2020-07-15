variable "app_namespace" {
  description = "The namespace where the module is deployed"
  type = string
}
variable "tiller_namespace" {
  description = "The namespace where Tiller is deployed"
  type = string
}
variable "chart_version" {
  description = "The chart version to be used"
  type = string
}

