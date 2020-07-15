# helm3-poc
A simple POC to validate helm migration.
Requires [both versions](https://medium.com/@Joachim8675309/install-helm3-helm2-on-macos-d65f61509799) of Helm installed.

## deploy v2 app
Build and deploy the docker images, add the repository to helm 2, then `terragrunt apply` in _terraform/environments/minikube/hello-v2_
