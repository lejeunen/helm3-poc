# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.

terraform {
  source = "git@github.com:lejeunen/helm3-poc.git//terraform/modules/hello-v3"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

locals {
  app_namespace = yamldecode(file("${find_in_parent_folders("common_values.yaml")}"))["app_namespace"]
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  app_namespace = local.app_namespace
  chart_version = "0.2.0"
}