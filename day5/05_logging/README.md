```sh
kubectl create -f ns.yaml
kubectl create -f .
kubectl rollout status deploy kibana
kubectl rollout status sts es-cluster
kubectl port-forward svc/kibana 5601:5601
kubectl delete -f .
```