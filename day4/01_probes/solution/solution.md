# create secret from literal
```sh
kubectl create secret generic redis-secret --from-literal REDIS_HOST=redis-service --from-literal REDIS_PORT=6379
```
# or from yaml
```sh
kubectl delete deploy python-deployment redis-deployment
kubectl apply -f python-configmap.yml
kubectl apply -f redis-secret.yml
kubectl apply -f python-service.yml
kubectl describe svc python-service
kubectl apply -f python-deployment.yml
PO=$(kubectl get pods -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl rollout status deployment python-deployment # hang
kubectl describe po $PO
# fail
kubectl exec -ti $PO -- curl python-service:5002/healthz
kubectl describe svc python-service
kubectl apply -f redis-service.yml
kubectl apply -f redis-deployment.yml
kubectl rollout status deployment redis-deployment
kubectl rollout status deployment python-deployment
PO=$(kubectl get pods -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl get po
kubectl describe po $PO
kubectl exec -ti $PO -- curl python-service:5002/healthz
kubectl describe svc python-service
kubectl delete svc redis-service
sleep 10
kubectl get po
kubectl describe svc python-service
kubectl delete -f .
```