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
kubectl create -f service.yaml
kubectl exec -ti myapp-pod curl my-app-service
kubectl exec -ti myapp-pod curl my-app-service.default.svc.cluster.local

kubectl exec -ti myapp-pod cat /etc/resolv.conf
```

# Remove pod and create it

kubectl exec -ti myapp-pod -- env

**Look at env exposed to POD**