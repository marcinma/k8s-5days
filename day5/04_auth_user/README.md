# Docs
ref: https://kubernetes.io/docs/reference/access-authn-authz/authentication/

# User
https://www.adaltas.com/en/2019/08/07/users-rbac-kubernetes/

```sh
openssl genrsa -out ubuntu.key 2048
openssl rand -writerand .rnd
openssl req -new -key ubuntu.key   -out ubuntu.csr   -subj "/CN=ubuntu"
sudo openssl x509 -req -in ubuntu.csr \
  -CA /etc/kubernetes/pki/ca.crt \
  -CAkey /etc/kubernetes/pki/ca.key \
  -CAcreateserial \
  -out ubuntu.crt -days 500

mkdir .certs && mv ubuntu.crt ubuntu.key .certs
```

```sh
kubectl config set-credentials ubuntu \
  --client-certificate=/home/ubuntu/.certs/ubuntu.crt \
  --client-key=/home/ubuntu/.certs/ubuntu.key

kubectl config set-context ubuntu-context \
  --cluster=kubernetes --user=ubuntu

kubectl --context=ubuntu-context get pods
kubectl create ns workshop
```
apply roles:

```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
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
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: deployment-manager-binding
  namespace: workshop
subjects:
- kind: User
  name: ubuntu
  apiGroup: ""
roleRef:
  kind: Role
  name: deployment-manager
  apiGroup: ""
```

```sh
kubectl --context=ubuntu-context get pods -n workshop
```