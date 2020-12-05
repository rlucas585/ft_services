#!/bin/bash

export MINIKUBE_IN_STYLE=false

# Only for Codam, so the computers don't explode
export MINIKUBE_HOME=~/goinfre

# Start the minikube cluster using virtualbox as the driver.
minikube start --driver=virtualbox

# Start the metrics-server
minikube addons enable metrics-server

# minikube is running its own docker daemon, use this line to connect
# to it.
eval $(minikube -p minikube --shell zsh docker-env)

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

docker build -t rlucas-nginx:1.0 srcs/nginx
docker build -t rlucas-influxdb:1.0 srcs/influxdb
docker build -t rlucas-grafana:1.0 srcs/grafana
docker build -t rlucas-telegraf:1.0 srcs/telegraf
docker build -t rlucas-mysql:1.0 srcs/mysql
docker build -t rlucas-wordpress:1.0 srcs/wordpress
docker build -t rlucas-phpmyadmin:1.0 srcs/phpmyadmin
docker build -t rlucas-ftps:1.0 srcs/ftps

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

# Deploy phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# Deploy FTPS
kubectl apply -f srcs/ftps/ftps.yaml
