# Manual expose

```sh
kubectl expose pod myapp-pod --type=NodePort --port=80
```

this works also on rc/deployment/ etc.

```sh
kubectl get service
```

Node port is exposed on each Azure VM
```sh
kubectl exec -ti myapp-pod curl <node-ip>:<node-port>
```

# Expose using declarative approach

```sh
kubectl create -f service.yml
kubectl exec -ti myapp-pod -- curl my-app-service
kubectl exec -ti myapp-pod -- curl my-app-service.default.svc.cluster.local

kubectl exec -ti myapp-pod -- cat /etc/resolv.conf
```

# Remove pod and create it

```sh
kubectl delete pod myapp-pod
kubectl create -f ../../06_pod/pod.yml
```

**Look at env exposed to POD**

```sh
kubectl exec -ti myapp-pod -- env
```

# Inspect services

```sh
kubectl get svc
kubectl get svc -o wide
kubectl describe svc my-app-service
kubectl get endpoints
``` 