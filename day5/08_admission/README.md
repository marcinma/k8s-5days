# Run on minikube

```sh
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.yaml 
kubectl get pods -n cert-manager  # Make sure all containers are running. 
kubectl create -f certs.yml
kubectl create -f rbac.yml
kubectl create -f deployment.yml
kubectl logs -l app=sample-mutating-webhook
kubectl create -f webhook.yml
kubectl create cm nginx-conf --from-file=nginx.conf=./nginx.conf
kubectl create -f pod.yml
kubectl describe po demo-pod
```

Pod has injected sidecar