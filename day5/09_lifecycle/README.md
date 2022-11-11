# Lifecycle

https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/
https://thecloudblog.net/lab/kubernetes-container-lifecycle-events-and-hooks/

```sh
kubectl create -f pod.yml
kubectl exec -ti lifecycle-demo -- cat /usr/share/message
```

```sh
kubectl create -f withsidecar.yml
kubectl get pod sidecar-container-demo
```