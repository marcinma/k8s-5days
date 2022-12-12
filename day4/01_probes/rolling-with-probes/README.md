```sh
kubectl apply -f rolling-ready.deployment.yml
watch kubectl get pods -l app=rolling -L version
kubectl patch deploy rolling-probes -p '{"spec":{"template":{"metadata":{"labels":{"version":"v2"}}}}}'
watch kubectl get pods -l app=rolling -L version
kubectl apply -f rolling-notready.deployment.yml
watch kubectl get pods -l app=rolling -L version
kubectl rollout undo deployment rolling-probes
kubectl delete -f rolling-notready.deployment.yml
```
