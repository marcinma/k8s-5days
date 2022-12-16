```sh
kubectl create -f recreate.deployment.yaml --save-config
kubectl get pods -l app=recreate
kubectl apply -f recreate.deployment-update.yaml
kubectl get pods -l app=recreate
```