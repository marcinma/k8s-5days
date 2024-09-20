# Role based access control
Role-based access control (RBAC) is a method of regulating access to computer or network resources based on the roles of individual users within your organization.

# Creation
```sh
kubectl create -f sa.pod-reader.yaml
kubectl create -f cluster-role.yaml
kubectl create -f cluster-role-binding.yaml
kubectl create -f pod-kctl.yaml
kubectl create -f pod.yml
kubectl logs -f pod-reader
```
# Get the ServiceAccount token from within the Pod's container

Find server IP in ~/.kube/config

```sh
kubectl get po my-pod-reader -o yaml # find projected volume
kubectl exec -ti my-pod-reader -- ls /run/secrets/kubernetes.io/serviceaccount
TOKEN=$(kubectl exec -ti my-pod-reader -- cat /run/secrets/kubernetes.io/serviceaccount/token)
API_SERVER=https://127.0.0.1:37759
API_SERVER=$(kubectl cluster-info | awk 'FNR == 1 {print $7}')
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1/namespaces/default/pods
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1/namespaces/kube-system/pods
```

Revoke token by removing pod
```sh
kubectl delete -f pod.yml
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1/namespaces/default/pods
```


# On Minikube

```sh
TOKEN=$(kubectl exec -ti my-pod-reader -- cat /run/secrets/kubernetes.io/serviceaccount/token)
API_SERVER=https://$(minikube ip):8443
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1/namespaces/default/pods
```

