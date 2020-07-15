
helm3 package hello-v3
mv *.tgz repository
helm3 repo index repository --url https://raw.githubusercontent.com/lejeunen/helm3-poc/master/charts/repository