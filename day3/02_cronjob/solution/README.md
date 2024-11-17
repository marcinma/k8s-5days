```sh
kubectl apply -f ../../00_task/solution_python_redis/
kubectl get po
PO=$(kubectl get po -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl exec -ti $PO -- curl 127.0.0.1:5002/api/v1/info
kubectl apply -f .
sleep 60
kubectl get po -l origin=cron-job
kubectl exec -ti $PO -- curl 127.0.0.1:5002/api/v1/info
kubectl delete -f .
kubectl delete -f ../../00_task/solution_python_redis/
```