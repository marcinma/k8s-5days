```sh
kubectl create -f .
kubectl get rs -o wide
kubectl get pods --show-labels
kubectl get po -l 'component in (db, rest)'
kubectl scale rs rs-rest --replicas=3
kubectl get pods -l 'component in (db, rest)'
kubectl delete rs rs-base --cascade=orphan
kubectl get pods 
kubectl delete rs rs-rest --cascade=orphan
kubectl get pods -l 'component in (db, rest)'
kubectl get po --show-labels
kubectl get po <pod-name> -o jsonpath='{.metadata.ownerReferences}'
kubectl get rs -o wide
kubectl scale rs rs-db --replicas=0
kubectl get po --show-labels
kubectl delete po --all
kubectl delete svc -l \!provider
```
