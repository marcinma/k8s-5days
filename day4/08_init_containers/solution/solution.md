```sh
kubectl delete svc redis-service
kubectl create -f waiting-for-redis.pod.yml
kubectl get pod waiting-for-redis
kubectl logs waiting-for-redis init-myservice
kubectl create -f redis.service.yaml
kubectl logs waiting-for-redis init-myservice
kubectl get pod waiting-for-redis
kubectl delete -f waiting-for-redis.pod.yml
```
