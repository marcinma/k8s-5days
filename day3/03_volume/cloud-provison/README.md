```sh
kubectl apply -f deployment-pv.yaml -f  pvc.yaml
kubectl get pv
kubectl get pvc
kubectl get po
kubectl describe pvc az01
kubectl delete pvc az01
kubectl get pvc
kubectl delete deploy nginx-deployment-az01
kubectl describe pvc az01
kubectl get pv
```

# Writing to PV

Create onc more time

```sh
kubectl apply -f deployment-pv.yaml -f  pvc.yaml
```

wait till it runs create some file in pod

```sh
kubectl exec -ti $(kubectl get po -l app=myapp-az01 -o jsonpath='{.items[0].metadata.name}') -- /bin/sh -c 'echo "content">file'
kubectl delete po -l app=myapp-az01
kubectl exec -ti $(kubectl get po -l app=myapp-az01 -o jsonpath='{.items[0].metadata.name}') -- cat file
```