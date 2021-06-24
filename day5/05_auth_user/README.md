# Docs
ref: https://kubernetes.io/docs/reference/access-authn-authz/authentication/
https://kubernetes.io/docs/tasks/administer-cluster/certificates/

https://www.adaltas.com/en/2019/08/07/users-rbac-kubernetes/
# User

openssl genrsa -out marcin.key 2048
openssl req -new -key marcin.key -out marcin.csr -subj "/CN=marcin/O=workshop"
openssl x509 -req -in marcin.csr -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -out marcin.crt -days 500


kubectl config set-credentials marcin --client-certificate=/home/maque/.certs/marcin.crt  --client-key=/home/maque/.certs/marcin.key
kubectl config set-context marcin-context --cluster=kubernetes --namespace=default --user=marcin

kubectl --context=marcin-context get pods


```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: workshop
  name: deployment-manager
rules:
- apiGroups: ["", "extensions", "apps"]
  resources: ["deployments", "replicasets", "pods"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"] # You can also use ["*"]
```

```yaml
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: deployment-manager-binding
  namespace: workshop
subjects:
- kind: User
  name: marcin
  apiGroup: ""
roleRef:
  kind: Role
  name: deployment-manager
  apiGroup: ""
```
