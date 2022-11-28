# StatefulSet 
StatefulSet is the workload API object used to manage stateful applications.
Manages the deployment and scaling of a set of Pods, and provides guarantees about the ordering and uniqueness of these Pods.

ref:
- https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/
- https://kubernetes.io/docs/tutorials/stateful-application/cassandra/


```sh
kubectl create -f nginx.statefulset.yaml

kubectl exec -ti nginx-stsf-0 -- /bin/bash
echo "nginx-stsf-0">index.html
kubectl exec -ti nginx-stsf-1 -- /bin/bash
echo "nginx-stsf-1">index.html

kubectl exec -ti nginx-stsf-0 -- curl localhost
kubectl exec -ti nginx-stsf-0 -- curl nginx-stsf-1.stsf-service
kubectl exec -ti nginx-stsf-0 -- curl nginx-stsf-1.stsf-service.default.svc.cluster.local
kubectl get pvc
kubectl get pv
```
*Pods in a StatefulSet have a unique ordinal index and a stable network identity.*

# Partition for canary update

https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/#rolling-out-a-canary

```
kubectl edit sts nginx-stsf
    # update partition to 1
    # update env
kubectl get po
kubectl exec -ti nginx-stsf-1 -- env | grep TEST
kubectl exec -ti nginx-stsf-0 -- env | grep TEST
```
