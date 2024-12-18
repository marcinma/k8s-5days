# Service
An abstract way to expose an application running on a set of Pods as a network service. Kubernetes gives Pods their own IP addresses and a single DNS name for a set of Pods, and can load-balance across them.

# Manual expose

```sh
kubectl expose pod myapp-pod --type=NodePort --port=80
```

this works also on rc/deployment/ etc.

```sh
kubectl get service
```

Node port is exposed on each worker node
```sh
kubectl exec -ti myapp-pod -- curl <node-ip>:<node-port>
NODE_IP=$(kubectl get nodes -l kubernetes.io/hostname=k8s-playground-worker2  -o jsonpath='{.items[0].status.addresses[0].address}')
NODE_PORT=$(kubectl get service myapp-pod -o jsonpath='{.spec.ports[0].nodePort}')
kubectl exec -ti myapp-pod -- curl $NODE_IP:$NODE_PORT
curl $NODE_IP:$NODE_PORT
kubectl exec -ti myapp-pod -- curl  myapp-pod
```

# Expose using declarative approach

```sh
kubectl create -f service.yml
kubectl exec -ti myapp-pod -- curl my-app-service
kubectl exec -ti myapp-pod -- curl my-app-service.default.svc.cluster.local
kubectl exec -ti myapp-pod -- cat /etc/resolv.conf
```

# Check env exposed to service then recreate it

```sh
kubectl exec -ti myapp-pod -- env
kubectl delete pod myapp-pod
kubectl create -f ../../06_pod/pod.yml
kubectl exec -ti myapp-pod -- env
```


# Inspect services

```sh
kubectl get svc
kubectl get svc -o wide
kubectl describe svc my-app-service
kubectl get endpoints
``` 