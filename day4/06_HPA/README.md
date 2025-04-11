# Horizontal Pod Autoscaling

In Kubernetes, a HorizontalPodAutoscaler automatically updates a workload resource (such as a Deployment or StatefulSet), with the aim of automatically scaling the workload to match demand.

hpa vs replicas - hpa will overwrite replicas
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

# V2

```sh
kubectl create -f hpa-v2/deployment.yml
kubectl create -f hpa-v2/hpa-v2.yml
kubectl get hpa
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"
kubectl delete po load-generator
kubectl get po -l run=php-apache
kubectl get hpa
kubectl get deployment php-apache
sleep 30
# will reduce to 1 even if deploy had 2 replicas
kubectl get hpa
kubectl get po -l run=php-apache
kubectl delete -f hpa-v2/
```