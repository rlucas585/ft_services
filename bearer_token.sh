#!/bin/bash
# kubectl -n kubernetes-dashboard describe secret $(kubectl -n \
# kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
kubectl -n kube-system describe secret $(kubectl -n \
kube-system get secret | grep dashboard-admin | awk '{print $1}')
