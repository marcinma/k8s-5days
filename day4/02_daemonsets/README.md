# DaemonSet
A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them.

```sh
kubectl create -f daemnoset.yaml
kubectl get ds
kubectl get pod -l app=ds -o wide
```
