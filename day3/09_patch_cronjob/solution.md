```sh
kubectl patch deploy redis-deployment -p '{"spec":{"template":{"spec":{"containers":[{"name":"container", "image":"redis:5.0.10"}]}}}}'
```