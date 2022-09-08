# Ingress traefik
An API object that manages external access to the services in a cluster, typically HTTP

kubectl create -f traefik-ingress/
kubectl create -f traefik.ingress.yaml
http://trenersages0621.westeurope.cloudapp.azure.com/dashboard/dashboard/

# Nginx ingress controller

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml
kubectl get pods --namespace=ingress-nginx
kubectl get svc -n=ingress-nginx

kubectl create -f nginx.deployment.yaml
kubectl create -f nginx-ingress/nginx.ingress.yaml
kubectl get ing
```

edit /etc/hosts to match
```/etc/hosts
192.168.0.101	demo.localdev.me
```

curl demo.localdev.me:<node-port-ingress>/nginx