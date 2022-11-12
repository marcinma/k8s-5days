# Run on minikube

```sh
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.yaml 
kubectl get pods -n cert-manager  # Make sure all containers are running. 
kubectl create -f rbac.yml
kubectl create -f deployment.yml
kubectl logs -l app=sample-mutating-webhook
kubectl create -f webhook.yml
```