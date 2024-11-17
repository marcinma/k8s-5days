# Horizontal Pod Autoscaling

In Kubernetes, a HorizontalPodAutoscaler automatically updates a workload resource (such as a Deployment or StatefulSet), with the aim of automatically scaling the workload to match demand.

hpa vs replicas - hpa will overwrite replicas

# V1

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

```sh
kubectl create -f hpa/sqrt.deployment.yaml
kubectl create -f hpa/sqrt.service.yaml
kubectl create -f hpa/hpa.yaml
kubectl get hpa

PORT=$(kubectl get svc sqrt-generator -o jsonpath='{.spec.ports[0].nodePort}')
IP=$(kubectl get node k8s-playground-worker -o jsonpath='{.status.addresses[0].address}')
curl $IP:$PORT



for i in {1..10}; do curl $IP:$PORT > /dev/null & done
watch kubectl get hpa
watch kubectl get pods -l  app=sqrt
```

# V2

```sh
kubectl create -f hpa-v2/deployment.yml
kubectl create -f hpa-v2/hpa-v2.yml
kubectl get hpa
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"
kubectl delete po  load-generator
kubectl get po -l run=php-apache
kubectl get hpa
kubectl get deployment php-apache
sleep 30
kubectl get hpa
kubectl get po -l run=php-apache
kubectl delete -f hpa-v2/
```