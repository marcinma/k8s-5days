```sh
kubectl create secret generic my-secret --from-file=./my-secrets --from-literal=user=marcin
kubectl get secret my-secret -o yaml
kubectl create -f pod-secret.yaml
kubectl logs secret-pod | grep USER
kubectl logs secret-pod | grep PASSWORD
kubectl get all
```
