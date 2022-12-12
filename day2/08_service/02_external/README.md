# External Name

When you create a service of type ExternalName, the Kubernetes DNS service is instead populated with a CNAME record

```sh
kubectl create -f google-svc.yml
kubectl exec -ti myapp-pod -- curl google-service

kubectl get svc
kubectl get endpoints
```

**output**

```
NAME             TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
google-service   ExternalName   <none>           google.com    <none>         41s
kubernetes       ClusterIP      10.96.0.1        <none>        443/TCP        94m
my-app-service   ClusterIP      10.99.25.3       <none>        80/TCP         7m30s
myapp-pod        NodePort       10.109.162.155   <none>        80:30867/TCP   44m

NAME             ENDPOINTS            AGE
kubernetes       192.168.0.102:6443   94m
my-app-service   192.169.25.132:80    7m34s
myapp-pod        192.169.25.132:80    45m
```