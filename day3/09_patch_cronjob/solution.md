```sh
kubectl create -f ../00_task/solution_python_redis/redis-deployment.yml
kubectl patch deploy redis-deployment -p '{"spec":{"template":{"spec":{"containers":[{"name":"container", "image":"redis:7.0.5"}]}}}}'
kubectl delete -f ../00_task/solution_python_redis/redis-deployment.yml
```
