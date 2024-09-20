## QoS

```sh
kubectl create -f pod-guaranted.yml
kubectl describe po guaranted
```

## Limit by default

https://kubernetes.io/docs/concepts/policy/limit-range/

```sh
kubectl create -f limitrange.yaml
kubectl describe limitrange mem-limit-range
kubectl create -f deployment.yaml
PO=$(kubectl get po -l app=readiness -o jsonpath='{.items[0].metadata.name}')
kubectl describe po $PO
```

```sh
kubectl create ns test-1
kubectl create -f ns-quota.yaml
kubectl create -f deployment.yaml -n test-1
kubectl rollout status deploy -n test-1 nginx-readiness
kubectl scale deployment -n test-1 nginx-readiness --replicas=3
kubectl -n test-1 describe deploy nginx-readiness
# will hang
kubectl rollout status deploy -n test-1 nginx-readiness
kubectl -n test-1 get deploy nginx-readiness
kubectl -n test-1 describe rs $(kubectl -n test-1 get rs -o jsonpath='{.items[0].metadata.name}')
kubectl -n test-1 get po
kubectl delete ns test-1
```

https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/memory-default-namespace/

## Resource quotas

A resource quota, defined by a ResourceQuota object, provides constraints that limit aggregate resource consumption per namespace.

https://kubernetes.io/docs/concepts/policy/resource-quotas/
