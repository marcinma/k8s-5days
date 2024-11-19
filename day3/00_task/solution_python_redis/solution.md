```sh
kubectl create -f .
kubectl rollout status deployment redis-deployment
kubectl rollout status deployment python-deployment
kubectl port-forward svc/python-service 5002:5002
curl localhost:5002/api/v1/info
kubectl delete -f .
```
