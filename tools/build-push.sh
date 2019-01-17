IMAGES=$(docker-compose config | yq '.' | jq -r '..|.image? | select(.!=null)')
IMAGES=(${IMAGES// / })

for i in "${!IMAGES[@]}"; do
  IMAGE_AND_TAG=${IMAGES[i]}
  echo ""
  echo "[$((i+1))] processing image ${IMAGE_AND_TAG}"
  IMAGE=${IMAGE_AND_TAG%:*}
  TAG=${IMAGE_AND_TAG#*:}
  echo ""
  echo "* IMAGE=$IMAGE and TAG=$TAG"
done
