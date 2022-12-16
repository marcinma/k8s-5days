```sh
kubectl create -f .
kubectl port-forward svc/python-service 5002:5002
curl localhost:5002/api/v1/info
```
