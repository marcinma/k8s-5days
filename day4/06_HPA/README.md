# Horizontal Pod Autoscaling

In Kubernetes, a HorizontalPodAutoscaler automatically updates a workload resource (such as a Deployment or StatefulSet), with the aim of automatically scaling the workload to match demand.


# V1

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

```sh
kubectl create -f hpa/sqrt.deployment.yaml
kubectl create -f hpa/sqrt.service.yaml
kubectl create -f hpa/hpa.yml
kubectl get hpa

kubectl get svc sqrt-generator
curl localhost:32402



for i in {1..10}; do kubectl exec -ti nginx-stsf-0 -- curl sqrt-generator & done
watch kubectl get hpa
watch kubectl get pods
```

# V2

```sh
kubectl create -f hpa-v2/deployment.yml
kubectl create -f hpa-v2/hpa-v2.yml
kubectl get hpa
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"
kubectl get hpa
kubectl get deployment php-apache

```