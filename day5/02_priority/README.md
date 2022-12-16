# Pod Priority and Preemption
Pods can have priority. Priority indicates the importance of a Pod relative to other Pods. If a Pod cannot be scheduled, the scheduler tries to preempt (evict) lower priority Pods to make scheduling of the pending Pod possible.

```sh
kubectl delete deploy --all
kubectl delete sts --all
kubectl delete ds --all
kubectl create -f high-priority.yml
kubectl get pc
kubectl create -f pod-to-be-removed.yml 
kubectl get pod -l app=remove
kubectl create -f preemptive-pod.yml
kubectl get pod -l app=remove
kubectl get po
```

critical pods for **shutdownGracePeriodCriticalPods**

```
kubectl get PriorityClass
NAME                      VALUE        GLOBAL-DEFAULT   AGE
system-cluster-critical   2000000000   false            10d
system-node-critical      2000001000   false            10d
```