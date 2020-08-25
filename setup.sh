#!/bin/bash

export MINIKUBE_IN_STYLE=false
export MINIKUBE_HOME=~/goinfre

# Start the minikube cluster using virtualbox as the driver.
minikube start --driver=virtualbox

# minikube is running its own docker daemon, use this line to connect
# to it.
eval $(minikube -p minikube docker-env)

# This line should set up auto complete options for kubectl
source <(kubectl completion zsh)

## MetalLB

# First, the namespace metallb-system needs to be created
kubectl apply -f srcs/metallb/metallb_namespace.yaml

# This line creates a memberlist secret, that is required for RBAC permissions
# of MetalLB
kubectl create secret generic -n metallb-system memberlist \
    --from-literal=secretkey="$(openssl rand -base64 128)"

# Now that the memberlist secret has been created for MetalLB, a MetalLB pod
# can be created.
kubectl apply -f srcs/metallb/metallb.yaml

## Create Docker images

# This is important to do before attaching new pods - create the docker images
# that the pods will run containers from
docker build -t rlucas-nginx:1.0 srcs/nginx
docker build -t rlucas-influxdb:1.0 srcs/influxdb
#PasswordAuthentication yes

## Apply yaml files

# Setup the kubernetes dashboard. To get the token to log in, run
# ./bearer_token.sh
kubectl apply -f srcs/dashboard/dashboard.yaml

# Creates an admin that can access the kubernetes dashboard
kubectl apply -f srcs/dashboard/sa_cluster_admin.yaml

# Run nginx server, with ssh enabled
kubectl apply -f srcs/nginx/nginx.yaml

# Create InfluxDB container
kubectl apply -f srcs/influxdb/influxdb.yaml
