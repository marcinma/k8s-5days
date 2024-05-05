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

Delete old stuff
```sh
kubectl delete deploy --all
kubectl delete pod --all
```

```sh
kubectl create -f python-deployment.yml
PO=$(kubectl get pods -l app=python -o jsonpath='{.items[0].metadata.name}')
kubectl get po $PO
# wait 60 seconds
kubectl describe po $PO
kubectl create -f redis-deployment.yml
```
