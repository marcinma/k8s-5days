# Configmap
A ConfigMap is an API object that lets you store configuration for other objects to use.

```sh
kubectl delete -f pod-config.yaml
kubectl apply -f pod-config.yaml
kubectl logs configmap-pod
```

# Mount as volume

```sh
kubectl delete -f pod-config-volume.yaml
kubectl apply -f pod-config-volume.yaml
kubectl logs configmap-volume-pod
```
