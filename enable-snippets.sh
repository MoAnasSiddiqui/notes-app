#!/bin/bash
kubectl -n ingress-nginx patch configmap ingress-nginx-controller --type merge -p '{"data":{"allow-snippet-annotations":"true"}}'
kubectl rollout restart deployment ingress-nginx-controller -n ingress-nginx
echo "Waiting for ingress controller rollout..."
kubectl -n ingress-nginx rollout status deployment/ingress-nginx-controller
cd book-store-mern-project/k8s
kubectl apply -f ingress.yaml
echo "Ingress Fix Applied"
