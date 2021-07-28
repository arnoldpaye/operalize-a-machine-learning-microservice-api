#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="arnoldpaye/mlmsapi"
tagversion="v1.0.0"
podname="mlmsapipod"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $podname --restart=Never --image $dockerpath:$tagversion --port 80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $podname 8000:80
