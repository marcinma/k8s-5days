```sh
kubectl create -f cache-deploy.yaml
kubectl get po -l distributed=cache -o wide
kubectl delete -f cache-deploy.yaml
```