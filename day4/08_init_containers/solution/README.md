```sh
kubectl delete svc redis-service
kubectl create -f waiting-for-redis.pod.yml
kubectl create -f redis.service.yaml
```