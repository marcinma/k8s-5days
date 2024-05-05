```sh
kubectl scale statefulset nginx-stsf --replicas=4
kubectl get pods -l app=stsf --watch
kubectl scale statefulset nginx-stsf --replicas=0
kubectl describe statefulset nginx-stsf
kubectl get pvc
kubectl scale statefulset nginx-stsf --replicas=2
kubectl get pods -l app=stsf --watch
kubectl exec -ti nginx-stsf-0 -- curl localhost
kubectl exec -ti nginx-stsf-1 -- curl localhost
kubectl delete pvc nginx-local-claim-nginx-stsf-3
kubectl delete pvc nginx-local-claim-nginx-stsf-2
kubectl delete -f nginx.statefulset.yaml
```

**output**
```
NAME                             STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
nginx-local-claim-nginx-stsf-0   Bound    pvc-febc195f-eac2-46e5-94e0-eb77dfc10fb5   1Gi        RWO            standard       16h
nginx-local-claim-nginx-stsf-1   Bound    pvc-12debbd8-fc41-450b-90b7-858261a733c6   1Gi        RWO            standard       16h
nginx-local-claim-nginx-stsf-2   Bound    pvc-d8f97e70-fcf3-454a-99dd-64eddb5a7df2   1Gi        RWO            standard       74s
nginx-local-claim-nginx-stsf-3   Bound    pvc-74d75c80-3194-49c9-80ec-16ce3a33f076   1Gi        RWO            standard       67s

nginx-stsf-0
nginx-stsf-1
```