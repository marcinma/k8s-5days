```sh

mkdir -p ~/.minikube/files/etc/ca-certificates/
cp users.csv ~/.minikube/files/etc/ca-certificates/

minikube start --extra-config=apiserver.token-auth-file=/etc/ca-certificates/users.csv
minikube logs | grep users.csv
curl -k https://$(minikube ip):8443/api/v1/namespaces/

curl -k -H "Authorization: Bearer john-specific-token-123" https://$(minikube ip):8443/api/v1/namespaces
kubectl create -f role.yml
kubectl create -f role-binding.yml
curl -k -H "Authorization: Bearer john-specific-token-123" https://$(minikube ip):8443/api/v1/namespaces
```