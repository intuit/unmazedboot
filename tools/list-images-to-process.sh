#!/bin/sh

IMAGES=$(docker-compose config | yq '.' | jq -r '..|.image? | select(.!=null)')

for IMAGE in ${IMAGES}; do  
  DOCKER_HUB_IMAGE_TAG=${IMAGE}; 
  echo "processing image ${DOCKER_HUB_IMAGE_TAG} "; 
  IMAGE=${DOCKER_HUB_IMAGE_TAG%:*};
  TAG=${DOCKER_HUB_IMAGE_TAG#*:};
  GROUP=${IMAGE/unmazedboot\//}

  IMG_NO_GRP=${IMAGE/GROUP/}

  CI_COMMIT_SHA=23920390293
  CI_REGISTRY_IMAGE="gitlab.com/regi/unmazed"
  
  echo "image name ${IMAGE} tag ${TAG} and group ${GROUP} image no group ${IMG_NO_GRP}"; 

  GITLAB_IMAGE="${CI_REGISTRY_IMAGE}/${GROUP}/${TAG}:${CI_COMMIT_SHA}";

  echo "=> Tag image ${DOCKER_HUB_IMAGE_TAG} for gitlab as ${GITLAB_IMAGE}";

  echo "<= Revert is 'docker pull ${GITLAB_IMAGE} && \n docker tag ${GITLAB_IMAGE} ${DOCKER_HUB_IMAGE_TAG}' && \n docker push ${DOCKER_HUB_IMAGE_TAG}"

  echo ""
done

