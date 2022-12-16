For 1.21

https://kubernetes.io/docs/concepts/workloads/pods/disruptions/

```sh
kubectl delete po --all
kubectl taint nodes ubuntu2 key=value:NoSchedule
kubectl create -f pdb.yml
kubectl apply -f deployment.yml

kubectl drain ubuntu1 --ignore-daemonsets 
# or
kubectl drain ubuntu1 --ignore-daemonsets  --delete-emptydir-data --force

kubectl uncordon ubuntu1
# remove quorum comment

kubectl apply -f deployment.yml
kubectl drain ubuntu1 --ignore-daemonsets  --delete-emptydir-data --force
kubectl uncordon ubuntu1
kubectl taint nodes ubuntu2 key=value:NoSchedule-
```
