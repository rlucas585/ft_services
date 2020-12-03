#!/bin/bash

export MINIKUBE_IN_STYLE=false
# export MINIKUBE_HOME=~/goinfre

# Start the minikube cluster using virtualbox as the driver.
minikube start --driver=virtualbox

# Start the metrics-server
minikube addons enable metrics-server

# minikube is running its own docker daemon, use this line to connect
# to it.
eval $(minikube -p minikube --shell zsh docker-env)

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

## Secret Generation

# Create Secrets for InfluxDB
# kubectl create secret generic influxdb-creds \
# 	--from-literal=INFLUXDB_DATABASE=telegrafdb \
# 	--from-literal=INFLUXDB_USERNAME=telegraf \
# 	--from-literal=INFLUXDB_PASSWORD=codam \
# 	--from-literal=INFLUXDB_HOST=influxdb

# Create Secrets for Grafana	-- Now handled in yaml files.
# kubectl create secret generic grafana-creds \
# 	--from-literal=GF_SECURITY_ADMIN_USER=admin \
# 	--from-literal=GF_SECURITY_ADMIN_PASSWORD=codam

## Create Docker images

# This is important to do before attaching new pods - create the docker images
# that the pods will run containers from
docker build -t rlucas-nginx:1.0 srcs/nginx
docker build -t rlucas-influxdb:1.0 srcs/influxdb
docker build -t rlucas-grafana:1.0 srcs/grafana
docker build -t rlucas-telegraf:1.0 srcs/telegraf
docker build -t rlucas-mysql:1.0 srcs/mysql
docker build -t rlucas-wordpress:1.0 srcs/wordpress
#PasswordAuthentication yes

## Apply yaml files

# Creates an admin that can access the kubernetes dashboard
kubectl apply -f srcs/dashboard/sa_cluster_admin.yaml

# Setup the kubernetes dashboard. To get the token to log in, run
# ./bearer_token.sh
kubectl apply -f srcs/dashboard/dashboard.yaml

## ConfigMap Generation

kubectl create configmap grafana-config \
  --from-file=influxdb-datasource.yml=srcs/grafana/influxdb-datasource.yml \
  --from-file=grafana-dashboard-provider.yml=srcs/grafana/grafana-dashboard-provider.yml

# Deploy Grafana
kubectl apply -f srcs/grafana/grafana.yaml

# Run nginx deployment
kubectl apply -f srcs/nginx/nginx.yaml

# Create InfluxDB container
kubectl apply -f srcs/influxdb/influxdb.yaml

# Create telegraf container
kubectl apply -f srcs/telegraf/telegraf.yaml

# Deploy MySQL
kubectl apply -f srcs/mysql/mysql.yaml

# Deploy WordPress
kubectl apply -f srcs/wordpress/wordpress.yaml
