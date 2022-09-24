# Horizontal Pod Autoscaling

In Kubernetes, a HorizontalPodAutoscaler automatically updates a workload resource (such as a Deployment or StatefulSet), with the aim of automatically scaling the workload to match demand.

*metric server required*

```sh
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

issue: https://github.com/kubernetes-sigs/metrics-server/issues/1025
```sh
kubectl -n kube-system edit deploy metrics-server
```
add `- --kubelet-insecure-tls` in `args`


https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

```sh
kubectl create -f hpa/sqrt.deployment.yaml
kubectl create -f hpa/sqrt.service.yaml
kubectl create -f hpa/hpa.yaml
kubectl get hpa

kubectl get svc sqrt-generator
curl localhost:32402

kubectl get --raw "/apis/metrics.k8s.io/v1beta1/namespaces/default/pods"

for i in {1..10}; do curl localhost:32402 & done
watch kubectl get hpa
watch kubectl get pods
```