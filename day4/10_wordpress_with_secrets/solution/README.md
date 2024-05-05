```sh
kubectl delete limitrange mem-limit-range
kubectl delete ing example-ingress
kubectl apply -f .
curl -v 192.168.0.2:31519/wp-admin/install.php
```