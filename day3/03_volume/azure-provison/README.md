```sh
kubectl apply -f deployment-pv.yaml -f  pvc-azure.yaml
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

#

Create onc more time

```sh
kubectl apply -f deployment-pv.yaml -f  pvc-azure.yaml
```
wait till it runs
create some file in pod
```sh
kubectl exec -ti $(kubectl get po -l app=myapp-az01 -o jsonpath='{.items[0].metadata.name}') -- /bin/sh -c 'echo "content">file'
```

create cloned pvc with deployment

```sh
kubectl apply -f deployment-pv-clone.yaml -f  pvc-azure-clone.yaml
```

check files 
```sh
kubectl exec -ti $(kubectl get po -l disk=cloned -o jsonpath='{.items[0].metadata.name}') -- cat file
```

write some other file to verify disk is not shared

```sh
kubectl exec -ti $(kubectl get po -l disk=cloned -o jsonpath='{.items[0].metadata.name}') -- /bin/sh -c 'echo "OtherContent">OtherFile'
kubectl exec -ti $(kubectl get po -l disk=cloned -o jsonpath='{.items[0].metadata.name}') -- ls
kubectl exec -ti $(kubectl get po -l app=myapp-az01 -o jsonpath='{.items[0].metadata.name}') -- ls
```