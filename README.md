# helm3-poc
A simple POC to validate helm migration.

Requirements
1. [both versions](https://medium.com/@Joachim8675309/install-helm3-helm2-on-macos-d65f61509799) of Helm installed.
1. [helm-2to3](https://github.com/helm/helm-2to3) plugin for Helm 3

## charts
[Package and index](https://github.com/lejeunen/helm3-poc/blob/master/charts/build-v2.sh) a v2 chart with Helm v2
[Package and index](https://github.com/lejeunen/helm3-poc/blob/master/charts/build-v2-with-v3.sh) a v2 chart with Helm v3

## deploy v2 app
Build and deploy the docker image if needed, add the repository to Helm 2, then `terragrunt apply` in _terraform/environments/minikube/hello-v2_

## migrate repository configuration
Use the plugin 

## deploy v3 app
`terragrunt apply` in _terraform/environments/minikube/hello-v3_

This proves that [version 1.0.0 and higher](https://github.com/hashicorp/terraform-provider-helm/blob/master/CHANGELOG.md#100-february-05-2020) of the Terraform Helm plugin can work with Helm 2 charts

## build