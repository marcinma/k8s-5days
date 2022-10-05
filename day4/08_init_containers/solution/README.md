```sh
kubectl delete svc redis-service
kubectl create -f waiting-for-redis.pod.yml
kubectl logs waiting-for-redis init-myservice
kubectl create -f redis.service.yaml
```
