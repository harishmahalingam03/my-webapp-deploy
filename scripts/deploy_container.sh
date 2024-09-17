#!/bin/bash
# Pull the latest image from ECR and run it
docker pull $ECR_REGISTRY:latest
docker stop static-website || true
docker rm static-website || true
docker run -d --name static-website -p 80:80 $ECR_REGISTRY:latest
