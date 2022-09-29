# Horizontal Pod Autoscaling

In Kubernetes, a HorizontalPodAutoscaler automatically updates a workload resource (such as a Deployment or StatefulSet), with the aim of automatically scaling the workload to match demand.

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
```

# RUN

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

```sh
kubectl create -f hpa/sqrt.deployment.yaml
kubectl create -f hpa/sqrt.service.yaml
kubectl create -f hpa/hpa.yaml
kubectl get hpa

kubectl get svc sqrt-generator
curl localhost:32402



for i in {1..10}; do kubectl exec -ti nginx-stsf-0 -- curl sqrt-generator & done
watch kubectl get hpa
watch kubectl get pods
```
