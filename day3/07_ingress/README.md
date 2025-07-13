# Nginx ingress controller

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.1/deploy/static/provider/cloud/deploy.yaml
kubectl get pods --namespace=ingress-nginx
kubectl get svc -n=ingress-nginx

kubectl create -f hello-app/hello.deployment.yaml
kubectl create -f hello-app/hello.deployment1.yaml
kubectl create -f hello-app/hello.ingress.yaml  
kubectl create -f hello-app/hello.ingress1.yaml  

kubectl get ing
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
curl --resolve mydomain.com:8080:127.0.0.1 http://mydomain.com:8080/v1
curl --resolve mydomain.com:8080:127.0.0.1 http://mydomain.com:8080/v2
```

Later:

```sh
kubectl delete -f hello-app/.
```

