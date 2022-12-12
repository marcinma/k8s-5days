# Secrets
A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key.

For mounting secrets into Pods, the kubelet stores a copy of the data into a `tmpfs` so that the confidential data is not written to durable storage.


```sh
kubectl create secret generic my-secret --from-file=./my-secrets --from-literal=user=marcin
kubectl get secret my-secret -o yaml
kubectl create -f pod-secret.yaml
kubectl logs secret-pod | grep USER
kubectl logs secret-pod | grep PASSWORD
kubectl get all
```

volume

```sh
kubectl create -f pod-volume.yaml
kubectl exec -ti mypod -- /bin/bash
    cd /etc/foo
    cat my-secrets
```

# docker secret

```sh
kubectl create secret docker-registry docker-secret --docker-email=test@example.com --docker-username=test --docker-password=password --docker-server=example.com

kubectl get secret docker-secret -o jsonpath='{.data.*}' | base64 -d
```

Such secret then can be used in imagePullSecrets

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: nginx
spec:
    containers:
    - name: nginx
      image: nginx
      imagePullPolicy: Always
    imagePullSecrets:
    - name: docker-secret
```