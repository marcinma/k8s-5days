# Probes
https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/


**Readines**
The kubelet uses readiness probes to know when a container is ready to start accepting traffic.
When a Pod is not ready, it is removed from Service load balancers.

**Liveness**
The kubelet uses liveness probes to know when to restart a container

**Startups**
The kubelet uses startup probes to know when a container application has started.
It disables liveness and readiness checks until it succeeds. If a container fails its startup probe, then the container is killed and follows the pod's restartPolicy


```sh
kubectl create -f python-deployment.yml
PO=$(kubectl get pods -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl get po $PO
sleep 60
kubectl describe po $PO
kubectl create -f redis-deployment.yml
kubectl expose deploy redis-deployment --port 6379 --name redis-service
sleep 30
kubectl get po $PO
kubectl describe po $PO
kubectl delete svc redis-service
kubectl delete -f python-deployment.yml
kubectl delete -f redis-deployment.yml
```
