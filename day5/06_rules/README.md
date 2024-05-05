## Taints

https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/
https://kubernetes.io/docs/tasks/administer-cluster/safely-drain-node/

**efects**
- NoSchedule
- PreferNoSchedule 
- NoExecute

taint node


```sh
kubectl taint nodes k8s-playground-worker key=value:NoSchedule
kubectl taint nodes k8s-playground-worker2 key=value:NoSchedule
kubectl create -f python-deployment.yml
kubectl describe pod -l app=python-taints
kubectl get pod -l app=python-taints
kubectl replace -f python-deployment-toleration.yml
kubectl describe pod -l app=python-taints

# untaint
kubectl taint nodes k8s-playground-worker key:NoSchedule-
kubectl taint nodes k8s-playground-worker2 key:NoSchedule-
```

evict pods
```sh
kubectl get pods -o wide
kubectl taint nodes k8s-playground-worker key=value1:NoExecute
kubectl taint nodes k8s-playground-worker2 key=value1:NoExecute
kubectl get pods
kubectl taint nodes k8s-playground-worker key=value1:NoExecute-
kubectl taint nodes k8s-playground-worker2 key=value1:NoExecute-
```