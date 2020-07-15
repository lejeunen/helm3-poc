# Build a V2 helm chart using Helm 3
helm3 package hello-v2
mv *.tgz repository
helm3 repo index repository --url https://raw.githubusercontent.com/lejeunen/helm3-poc/master/charts/repository