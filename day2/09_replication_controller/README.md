# ReplicationController
A ReplicationController ensures that a specified number of pod replicas are running at any one time.

Legacy - deployment + replicaset is the recommended way to set up replication

```sh
kubectl create -f replication-controller.yml
kubectl get rc
kubectl describe rc/nginx
kubectl get pods -l app=nginx

kubectl scale rc/nginx --replicas=2
kubectl expose rc/nginx --type=NodePort --port 80

kubectl get svc -l app=nginx
kubectl describe svc nginx

kubectl exec -ti myapp-pod -- curl nginx

kubectl logs -f -l app=nginx


kubectl delete -f replication-controller.yml
kubectl get pods -l app=nginx
kubectl describe svc nginx
kubectl delete svc nginx
```