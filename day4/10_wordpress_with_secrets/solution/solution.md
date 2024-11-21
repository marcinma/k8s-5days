```sh
kubectl delete limitrange mem-limit-range
kubectl apply -f .
IP=$(kubectl get node k8s-playground-worker -o jsonpath='{.status.addresses[0].address}')
curl -v $IP:31519/wp-admin/install.php

kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
curl --resolve mydomain.com:8080:127.0.0.1 http://mydomain.com:8080/wordpress/wp-admin/install.php
kubectl delete -f .
```