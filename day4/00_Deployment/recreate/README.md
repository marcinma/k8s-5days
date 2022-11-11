```sh
kubectl create -f recreate.deployment.yaml
kubectl get pods -l app=recreate
kubectl edit deploy recreate-deployment
kubectl get pods -l app=recreate
```