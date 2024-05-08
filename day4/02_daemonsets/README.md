# DaemonSet
A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them.

remove previous stuff
```sh
kubectl delete deploy --all
kubectl delete pvc --all
```

```sh
kubectl apply -f daemonset.yaml
kubectl get ds
kubectl get pod -l app=ds -o wide
kubectl rollout status ds/nginx-ds
kubectl replace -f daemonset-replace.yaml
kubectl rollout status ds/nginx-ds
kubectl rollout history ds/nginx-ds --revision 2
watch kubectl get pod -l app=ds -o wide
kubectl delete -f daemonset.yaml
```

## Node selector

```sh
kubectl create -f daemonset-node-selector.yaml
kubectl get ds
kubectl get pod -l app=ds-node -o wide
kubectl label node <node-name> color=red
kubectl get pod -l app=ds-node -o wide
kubectl label node <node-name> color-
kubectl get pod -l app=ds-node -o wide
```
