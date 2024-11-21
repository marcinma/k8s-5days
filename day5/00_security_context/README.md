# Pod Security Policies

PodSecurityPolicy was deprecated in Kubernetes v1.21, and removed from Kubernetes in v1.25.

https://kubernetes.io/docs/tasks/configure-pod-container/enforce-standards-namespace-labels/

https://kubernetes.io/docs/concepts/security/pod-security-standards/

# Pod Security Admission

https://kubernetes.io/docs/concepts/security/pod-security-admission/

# Security context

```sh
kubectl create -f pod-scx.yml
kubectl exec -ti pod-scx -- id
kubectl exec -ti pod-scx -- ps
kubectl exec -ti pod-scx -- ls -l /data
kubectl delete -f pod-scx.yml
```


# Reading logs from containers

```sh
kubectl create -f pod-log.yml
kubectl exec -ti cant-read-vol-log -- /bin/sh
cd /var/log/pods
kubectl delete -f pod-log.yml
```


```sh
kubectl create -f pod-log-can-read.yml
kubectl exec -ti read-vol-log -- /bin/sh
cd /var/log/pods
kubectl delete -f pod-log-can-read.yml
```

