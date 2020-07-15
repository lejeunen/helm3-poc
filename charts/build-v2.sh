
helm2 package hello-v2
mv *.tgz repository
helm2 repo index repository --url https://raw.githubusercontent.com/lejeunen/helm3-poc/master/charts/repository