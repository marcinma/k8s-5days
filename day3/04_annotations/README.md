# Annotations
You can use Kubernetes annotations to attach arbitrary non-identifying metadata to objects. When in doubt, add information to an object as an annotation and promote it to a label if you find yourself wanting to use it in a selector. Size of keys + size of values for all annotations can't be longer than 256 kB.

```json
"metadata": {
  "annotations": {
    "key1" : "value1",
    "key2" : "value2"
  }
}
```

```sh
kubectl create -f pod.yml
kubectl annotate pod  $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') workshop.test=verified
kubectl get pods $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}')  -o jsonpath='{.metadata.annotations}'
kubectl describe pods $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}')  
```