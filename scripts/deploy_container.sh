#!/bin/bash
set -e
# Pull the latest image from ECR and run it
aws ecr get-login-password --region $AWS_DEFAULT_REGION | sudo docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
docker pull $ECR_REGISTRY:latest
docker stop static-website || true
docker rm static-website || true
docker run -d --name static-website -p 80:80 $ECR_REGISTRY:latest
