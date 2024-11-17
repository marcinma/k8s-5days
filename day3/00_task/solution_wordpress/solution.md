```sh
kubectl create -f .
kubectl port-forward svc/wordpress-service 8080:80
curl localhost:8080/wp-admin/install.php
kubectl delete -f .
```
