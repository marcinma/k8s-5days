# StatefulSet 
StatefulSet is the workload API object used to manage stateful applications.
Manages the deployment and scaling of a set of Pods, and provides guarantees about the ordering and uniqueness of these Pods.

ref:
- https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/
- https://kubernetes.io/docs/tutorials/stateful-application/cassandra/


```sh
kubectl create -f nginx.statefulset.yaml

kubectl exec -ti nginx-stsf-0 -- /bin/bash -c 'echo "nginx-stsf-0">index.html'
kubectl exec -ti nginx-stsf-1 -- /bin/bash -c 'echo "nginx-stsf-1">index.html'

kubectl exec -ti nginx-stsf-0 -- curl localhost
kubectl exec -ti nginx-stsf-0 -- curl nginx-stsf-1.stsf-service
kubectl exec -ti nginx-stsf-0 -- curl nginx-stsf-1.stsf-service.default.svc.cluster.local
kubectl get pvc
kubectl get pv
kubectl get sts
```
*Pods in a StatefulSet have a unique ordinal index and a stable network identity.*

# Headless service in action

```sh
kubectl create -f nslookup.pod.yml
kubectl logs nslookup-stsf
```

# Partition for canary update

- https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/#rolling-out-a-canary
- https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#partitions

```sh
kubectl apply -f nginx.statefulset-partition.yaml
kubectl get po -l app=stsf
kubectl exec -ti nginx-stsf-1 -- env | grep VERSION
kubectl exec -ti nginx-stsf-0 -- env | grep VERSION
```

**Important!** : Pods with an ordinal that is less than the partition will not be updated, even if they are deleted, they will be recreated at the previous version