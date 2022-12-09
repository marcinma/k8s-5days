# POD
Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.


```sh
kubectl apply -f pod.yml
kubectl get pods
kubectl get pods -A
kubectl get all
kubectl get pod -A --selector="app=myapp"
kubectl get pod -A -l app=myapp
kubectl exec -ti myapp-pod -- curl localhost
kubectl logs myapp-pod
kubectl port-forward pod/myapp-pod 8282:80
curl localhost:8282
```

or
```sh
kubectl proxy
```

http://localhost:8001/api/v1/namespaces/default/pods/myapp-pod/proxy/

**output**

```
pod/myapp-pod created

NAME        READY   STATUS    RESTARTS   AGE
myapp-pod   1/1     Running   0          12s

NAMESPACE              NAME                                         READY   STATUS              RESTARTS      AGE
default                myapp-pod                                    0/1     ContainerCreating   0             0s
kube-system            coredns-78fcd69978-n7w25                     1/1     Running             1 (64m ago)   2d2h
kube-system            etcd-minikube                                1/1     Running             1 (64m ago)   2d2h
kube-system            kube-apiserver-minikube                      1/1     Running             1 (64m ago)   2d2h
kube-system            kube-controller-manager-minikube             1/1     Running             1 (64m ago)   2d2h
kube-system            kube-proxy-2dlgt                             1/1     Running             1 (64m ago)   2d2h
kube-system            kube-scheduler-minikube                      1/1     Running             1 (64m ago)   2d2h
kube-system            storage-provisioner                          1/1     Running             2 (64m ago)   2d2h
kubernetes-dashboard   dashboard-metrics-scraper-856586f554-2gdp7   1/1     Running             0             8m46s
kubernetes-dashboard   kubernetes-dashboard-67484c44f6-9pfvw        1/1     Running             0             8m46s

NAME            READY   STATUS    RESTARTS   AGE
pod/myapp-pod   1/1     Running   0          26s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   2d2h

(...)
127.0.0.1 - - [02/Sep/2022:13:26:57 +0000] "GET / HTTP/1.1" 200 612 "-" "curl/7.37.1"

```