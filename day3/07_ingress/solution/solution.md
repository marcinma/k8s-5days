```sh
kubectl create -f .
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
curl --resolve mydomain.com:8080:127.0.0.1 http://mydomain.com:8080/python/healthz
curl --resolve mydomain.com:8080:127.0.0.1 http://mydomain.com:8080/python/api/v1/info
kubectl delete -f .
```