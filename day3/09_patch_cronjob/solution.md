```sh
kubectl patch deploy redis-deployment -p '{"spec":{"template":{"spec":{"containers":[{"name":"container", "image":"redis:7.0.5"}]}}}}'
```
