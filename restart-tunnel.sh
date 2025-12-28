#!/bin/bash
pkill -f 'kubectl port-forward' || true
pkill -f ngrok || true
nohup kubectl port-forward -n ingress-nginx svc/ingress-nginx-controller 8080:80 > pf.log 2>&1 &
nohup ngrok http 8080 > ngrok.log 2>&1 &
sleep 10
curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url'
