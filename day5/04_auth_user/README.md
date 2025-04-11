# Docs
ref: https://kubernetes.io/docs/reference/access-authn-authz/authentication/

# User
https://www.adaltas.com/en/2019/08/07/users-rbac-kubernetes/

```sh
mkdir .certs && cd .certs
openssl rand -writerand .rnd
# generate key
openssl genrsa -out ubuntu.key 2048
# generate certificate sign request for common name ubuntu
openssl req -new -key ubuntu.key   -out ubuntu.csr   -subj "/CN=ubuntu"
# get base64 no new line csr
REQUEST=$(cat ubuntu.csr | base64 | tr -d "\n")
# create CertificateSigningRequest
cat <<EOF | kubectl apply -f -
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: ubuntu
spec:
  request: $REQUEST
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400  # one day
  usages:
  - client auth
EOF
# sign
kubectl certificate approve ubuntu
kubectl describe csr/ubuntu 
# extract cert
kubectl get csr/ubuntu -o jsonpath="{.status.certificate}" | base64 -d > ubuntu.crt
# setup key & cert for user
kubectl config set-credentials ubuntu --client-key ubuntu.key --client-certificate ubuntu.crt --embed-certs=true
# set context for user
kubectl config set-context ubuntu-context --cluster=kind-k8s-playground --user=ubuntu

kubectl create ns workshop
kubectl auth can-i get pods --namespace=workshop --as=ubuntu
kubectl --context=ubuntu-context --user=ubuntu get pods
kubectl --context=ubuntu-context --user=ubuntu -n workshop get pods
cd ../
# apply roles
kubectl apply -f role-binding.yml -f role.yml

# check again
kubectl --context=ubuntu-context --user=ubuntu get pods
kubectl --context=ubuntu-context --user=ubuntu get pods -n workshop
kubectl auth can-i get pods --namespace=workshop --as=ubuntu
kubectl delete -f role-binding.yml -f role.yml
kubectl auth can-i get pods --namespace=workshop --as=ubuntu
rm -rf .certs
```
