ref:
https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/
https://kubernetes.io/docs/tutorials/stateful-application/cassandra/


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
