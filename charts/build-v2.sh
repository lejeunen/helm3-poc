
helm2 package hello-v2
mv hello-v2-0.1.0.tgz repository
helm2 repo index repository --url https://raw.githubusercontent.com/lejeunen/helm3-poc/master/charts/repository