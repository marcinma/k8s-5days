## Taints

https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/

**efects**
- NoSchedule
- PreferNoSchedule 
- NoExecute

taint node


```sh
kubectl taint nodes  aks-agentpool-36056202-vmss000001 key=value:NoSchedule
kubectl create -f python-deployment.yml
kubectl describe pod -l app=python-taints
# remove comments
kubectl apply -f python-deployment.yml
kubectl describe pod -l app=python-taints

# untaint
kubectl taint nodes  aks-agentpool-36056202-vmss000001 key:NoSchedule-
```

evict pods
```sh
kubectl taint nodes  aks-agentpool-36056202-vmss000001 key=value1:NoExecute
kubectl get pods
kubectl taint nodes  aks-agentpool-36056202-vmss000001 key=value1:NoExecute-
```