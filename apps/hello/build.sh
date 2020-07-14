#!/usr/bin/env bash

# build the jar
mvn clean package -q

# unpack the fat jar
rm -rf target/dependency
mkdir target/dependency
(
  cd target/dependency
  jar -xf ../*.jar
)

# define image name
NAME=lejeunen/hello
TAG='t'$(date +%Y%m%d%H%M%S)'-'$(git log -1 --format=%h)
IMAGE=${NAME}:${TAG}
LATEST=${NAME}:latest
echo ">>>>>"
echo ${IMAGE}
echo ">>>>>"

# actual docker build
docker build -t ${IMAGE} .

if [ $? -ne 0 ]; then
  echo "Unable to build the image (${IMAGE})"
  exit 1
fi

# tag and push
docker tag ${IMAGE} ${LATEST}
if [ $? -ne 0 ]; then
  echo "Unable to tag the image with ${IMAGE} & ${LATEST}"
  exit 1
fi
docker push ${IMAGE}
if [ $? -ne 0 ]; then
  echo "Unable to push the image with tag ${IMAGE} to the repository"
  exit 1
fi
docker push ${LATEST}
if [ $? -ne 0 ]; then
  echo "Unable to push the image with tag ${LATEST} to the repository"
  exit 1
fi
