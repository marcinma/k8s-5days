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

Create different pods using same configmap
```sh
kubectl create -f pod-config-volume-items.yaml -f pod-config-volume-subpath.yaml -f pod-config-volume.yaml
```

Check default pod
```sh
kubectl exec -ti configmap-volume-pod -- ls /usr/local/nginx/html/
kubectl exec -ti configmap-volume-pod -- cat /usr/local/nginx/html/service-b.config
```

Check pod with items
```sh
kubectl exec -ti configmap-volume-items -- ls /usr/local/nginx/html/
kubectl exec -ti configmap-volume-items -- cat /usr/local/nginx/html/myconfig
```

Check pod with subpath
```sh
kubectl exec -ti configmap-volume-subpath -- ls /usr/local/nginx/html/
kubectl exec -ti configmap-volume-subpath -- cat /usr/local/nginx/html/service-b.config
```

# Autoupdates for mounted configmaps
```sh
kubectl edit cm configuration
# change service-b.config
# wait aprox 30 seconds
kubectl exec -ti configmap-volume-pod -- cat /usr/local/nginx/html/service-b.config
sleep 30
kubectl exec -ti configmap-volume-pod -- cat /usr/local/nginx/html/service-b.config
```

Check autoupdate
```sh
kubectl exec -ti configmap-volume-items -- cat /usr/local/nginx/html/myconfig
```

autoupdate doesn't work for subpath:
```sh
kubectl exec -ti configmap-volume-subpath -- cat /usr/local/nginx/html/service-b.config
```

# immutable

```sh
kubectl create -f immutable-configmap.yaml
kubectl patch cm/immutable -p '{"data":{"somekey":"newvalue"}}'
kubectl create -f mutable-configmap.yaml
kubectl patch cm/mutable -p '{"data":{"somekey":"newvalue"}}'
```