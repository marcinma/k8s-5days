```sh
kubectl apply -f rolling.deployment.yml
kubectl get pods -l app=rolling
kubectl apply -f rolling.deployment-update.yml
kubectl get po -L version -l app=rolling -L version
kubectl delete -f rolling.deployment.yml
```
