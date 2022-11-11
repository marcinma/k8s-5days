```sh
kubectl create -f .
kubectl port-forward svc/wordpress-service 8080:80
kubectl get svc
curl 192.168.0.102:31662
```
