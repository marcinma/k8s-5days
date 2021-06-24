1. https://kubernetes.io/docs/concepts/policy/pod-security-policy/
2. https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#podsecuritypolicy

```sh
kubectl create -f pod-scx.yml
kubectl exec -ti pod-scx -- sh
```

```sh
id
ps
ls -l /data
```


```sh
kubectl create -f pod-log.yml
kubectl exec -ti read-vol-log -- /bin/sh
cd /var/log/pods
```

try to read logs
change group/user to 0
```sh
kubectl replace --force -f pod-log.yml
kubectl exec -ti read-vol-log -- /bin/sh
cd /var/log/pods
```