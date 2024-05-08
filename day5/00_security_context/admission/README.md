```sh
kubectl apply -f namespace.yml
kubectl apply -f deployment.nginx.yml
kubectl apply -f deployment.nginx-wrong.yml
kubectl get po -n app
```