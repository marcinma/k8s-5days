# Probes
https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/


**Readines**
The kubelet uses readiness probes to know when a container is ready to start accepting traffic.
When a Pod is not ready, it is removed from Service load balancers.

**Liveness**
The kubelet uses liveness probes to know when to restart a container

**Startups**
The kubelet uses startup probes to know when a container application has started.
It disables liveness and readiness checks until it succeeds


```sh
kubectl create -f python-deployment.yml
PO=$(kubectl get pods -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl describe po $PO
kubectl create -f redis-deployment.yml
```