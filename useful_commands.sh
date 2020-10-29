#!/bin/bash

# Commands that don't need to be run to setup the cluster, but are useful
# in testing.

# attach to a pod
kubectl exec -it <pod-name>
# More versatile
kubectl exec -it $(kubectl get pods | grep "$1" | grep -v "Terminating" \
| awk '{print $1}') -- sh
