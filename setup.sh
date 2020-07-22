#!/bin/bash

# Start the minikube cluster using virtualbox as the driver.
minikube start --driver=virtualbox

# minikube is running its own docker daemon, use this line to connect
# to it.
eval $(minikube -p minikube docker-env)

# This line should set up auto complete options for kubectl
# source <(kubectl completion zsh)

# First, the namespace metallb-system needs to be created
kubectl create -f metallb_namespace.yaml

# This line creates a memberlist secret, that is required for RBAC permissions
# of MetalLB
kubectl create secret generic -n metallb-system memberlist \
    --from-literal=secretkey="$(openssl rand -base64 128)"

# Now that the memberlist secret has been created for MetalLB, a MetalLB pod
# can be created.
kubectl create -f metallb.yaml

# This is important to do before attaching new pods - create the docker images
# that the pods will run containers from
docker build -t rlucas-nginx:1.0 srcs/nginx
#PasswordAuthentication yes

# Setup the kubernetes dashboard. To get the token to log in, run
# ./bearer_token.sh
kubectl create -f dashboard.yaml

kubectl create -f k8s-dashboard-loadbalancer.yaml

# Run nginx server, with ssh enabled
kubectl create -f nginx.yaml
