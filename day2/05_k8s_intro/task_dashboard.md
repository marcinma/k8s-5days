kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login



kubectl create -f admin-user.yml
kubectl create -f rbac-admin.yml

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret  -o jsonpath='{.items[0].metadata.name}')


kubectl proxy
jwt