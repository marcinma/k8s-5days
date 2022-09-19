```sh
kubectl create -f ns.yaml
kubectl create -f .
kubectl port-forward svc/kibana 5601:5601
```