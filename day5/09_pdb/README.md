For 1.21

https://kubernetes.io/docs/concepts/workloads/pods/disruptions/

```sh
kubectl delete po --all
kubectl taint nodes <node-name-1> key=value:NoSchedule
kubectl create -f pdb.yml
kubectl apply -f deployment.yml

kubectl drain <node-name-2> --ignore-daemonsets  --delete-emptydir-data --force

kubectl uncordon <node-name-2>
# remove quorum comment

kubectl apply -f deployment.yml
kubectl drain <node-name-2> --ignore-daemonsets  --delete-emptydir-data --force
kubectl uncordon <node-name-2>
kubectl taint nodes <node-name-1> key=value:NoSchedule-
```