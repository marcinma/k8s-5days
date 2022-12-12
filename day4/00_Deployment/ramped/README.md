```sh
kubectl create -f rolling.deployment.yml
kubectl get pods -l app=rolling
kubectl edit deploy rolling
watch kubectl get po -L version -l app=rolling
kubectl delete -f rolling.deployment.yml
```
