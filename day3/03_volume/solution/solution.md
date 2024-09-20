```sh
kubectl apply -f .
PYPO=$(kubectl get pods -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl exec -ti $PYPO -- curl localhost:5002/healthz
kubectl exec -ti $PYPO -- curl -XPOST localhost:5002/api/v1/info
kubectl exec -ti $PYPO -- curl localhost:5002/api/v1/info
kubectl scale deployment redis-deployment --replicas=0
kubectl rollout status deployment redis-deployment
kubectl get po

kubectl scale deployment redis-deployment --replicas=1
kubectl rollout status deployment redis-deployment
kubectl get po
kubectl exec -ti $PYPO -- curl localhost:5002/api/v1/info
```