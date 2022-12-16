# Configmap
A ConfigMap is an API object that lets you store configuration for other objects to use.

```sh
kubectl create configmap configuration --from-file=./creation
kubectl get configmap/configuration -o yaml
kubectl get cm/configuration -o yaml
```

# From env file
```sh
kubectl create configmap fromenv --from-env-file=./creation/env-file-example
kubectl get configmap/fromenv -o json
kubectl get configmap/fromenv -o yaml
```
# Data as file

```sh
kubectl create configmap test-config --from-file=<my-key-name>=<path-to-file>
kubectl create configmap test-config --from-file=s.json=./creation/service.json
kubectl get configmap/test-config -o yaml
```
# Create pods

```sh
kubectl create -f pod-config.yaml
kubectl logs configmap-pod
kubectl logs configmap-pod | grep Name
```

```sh
kubectl create -f pod-config-volume.yaml
kubectl logs configmap-volume-pod
```

# Autoupdates for mounted configmaps
```sh
kubectl edit cm configuration
# change service-b.config
kubectl logs -f configmap-volume-pod
```