# ON PREMISE ONLY
*metric server required*

```sh
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

issue: https://github.com/kubernetes-sigs/metrics-server/issues/1025
```sh
kubectl -n kube-system edit deploy metrics-server
```
add `- --kubelet-insecure-tls` in `args`

```sh
kubectl get --raw "/apis/metrics.k8s.io/v1beta1/namespaces/default/pods"
kubectl top nodes
kubectl top pods
```
