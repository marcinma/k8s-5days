```sh
kubectl create -f .
kubectl port-forward svc/python-service 5002:5002
curl localhost:5002/api/v1/info
kubectl get svc
curl 192.168.0.102:31662/api/v1/info
```