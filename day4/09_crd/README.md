# Custom Resources

Custom resources are extensions of the Kubernetes API.

https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/

# Create crd

```sh
kubectl get deploycreators
kubectl apply -f bash-operator/kubernetes
kubectl get CustomResourceDefinition
kubectl get CustomResourceDefinition deploycreators.bash-operators.marcin
kubectl get deploycreators
kubectl get dc
```

```sh
kubectl apply -f bash-operator/example/example.missing-fields.yaml
kubectl apply -f bash-operator/example/example.deploy-creator-beta.yaml
kubectl get dc
kubectl describe dc example-deploy-creator
kubectl logs -l app=deploy-creator
kubectl get deploy
kubectl get deploy | grep marcin
kubectl get po | grep marcin
kubectl delete deploy --all
kubectl delete po --all
kubectl delete -f bash-operator/kubernetes
```
