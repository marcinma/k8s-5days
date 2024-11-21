```sh
kubectl apply -f namespace.yml
kubectl apply -f deployment.nginx.yml
kubectl apply -f deployment.nginx-wrong.yml
kubectl get po -n app
# check logs in app namespace
PO=$(kubectl get pods -n app -l node.type=nginx-wrong -o jsonpath='{.items[0].metadata.name}')
kubectl -n app describe po $PO
kubectl -n app logs $PO
kubectl delete -f namespace.yml
```