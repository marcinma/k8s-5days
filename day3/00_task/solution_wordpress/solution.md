```sh
kubectl create -f .
kubectl rollout status deployment wordpress-deployment
kubectl rollout status deployment mysql-deployment
kubectl port-forward svc/wordpress-service 8080:80
curl localhost:8080/wp-admin/install.php
kubectl delete -f .
```
