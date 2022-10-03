For 1.21

https://kubernetes.io/docs/concepts/workloads/pods/disruptions/

```sh
kubectl taint nodes ubuntu2 key=value:NoSchedule
kubectl create -f pdb.yml
kubectl create -f deployment.yml
kubectl drain ubuntu1 --ignore-daemonsets
kubectl uncordon ubuntu1
(..remove comment..)
kubectl taint nodes ubuntu2 key=value:NoSchedule-
```