# Init Containers
Specialized containers that run before app containers in a Pod.
- Init containers always run to completion.
- Each init container must complete successfully before the next one starts.


https://kubernetes.io/docs/concepts/workloads/pods/init-containers/


```sh
kubectl create -f initc.pod.yml
kubectl get pods myapp-pod
kubectl logs myapp-pod init-myservice
kubectl get pods myapp-pod
kubectl logs myapp-pod myapp-container
kubectl delete -f initc.pod.yml
```
