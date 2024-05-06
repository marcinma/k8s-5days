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
kubectl annotate pod pod-with-annotations workshop.test=verified
kubectl annotate pod pod-with-annotations --list
kubectl get pods pod-with-annotations -o jsonpath='{.metadata.annotations}'
kubectl describe pods pod-with-annotations 
kubectl annotate pod pod-with-annotations workshop.test-
kubectl describe pods pod-with-annotations 
kubectl delete -f pod.yml
```