# DaemonSet
A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them.

remove previous stuff
```sh
kubectl delete deploy --all
kubectl delete pvc --all
```

```sh
kubectl create -f daemnoset.yaml
kubectl get ds
kubectl get pod -l app=ds -o wide
kubectl rollout status ds/nginx-ds
kubectl patch ds/nginx-ds -p '{"spec":{"template":{"spec":{"containers":[{"name":"myapp-ds","env":[{"name":"TEST","value":"TEST2"}]}]}}}}'
watch kubectl get pod -l app=ds -o wide
kubectl delete -f daemnoset.yaml
```

## Node selector

```sh
kubectl create -f daemnoset-node-selector.yaml
kubectl get ds
kubectl get pod -l app=ds-node -o wide
kubectl label node ubuntu2 color=red
kubectl get pod -l app=ds-node -o wide
kubectl label node ubuntu2 color-
kubectl get pod -l app=ds-node -o wide
```
