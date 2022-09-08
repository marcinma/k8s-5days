# Role based access control
Role-based access control (RBAC) is a method of regulating access to computer or network resources based on the roles of individual users within your organization.

# Creation
```sh
kubectl create -f sa.pod-reader.yaml
kubectl create -f cluster-role.yaml
kubectl create -f rbac.yaml
kubectl create -f pod.yml
kubectl create -f pod-kctl.yaml
kubectl logs -f pod-reader
```
# Get the ServiceAccount token from within the Pod's container

kubectl -n kube-system describe secret default

```sh
TOKEN=$(kubectl exec -ti my-pod-reader -- cat /run/secrets/kubernetes.io/serviceaccount/token)
API_SERVER=https://trener-dns-1a789921.hcp.westeurope.azmk8s.io:443
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1
curl -k -H "Authorization: Bearer $TOKEN" $API_SERVER/api/v1/namespaces/default/pods
```


