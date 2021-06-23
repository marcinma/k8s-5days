```sh
kubectl create -f python-deployment.yml
PO=$(kubectl get pods -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl describe po $PO
kubectl create -f redis-deployment.yml
```

https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/
Readines

Liveness

Startups