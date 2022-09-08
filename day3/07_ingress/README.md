# Ingress traefik
An API object that manages external access to the services in a cluster, typically HTTP

kubectl create -f traefik-ingress/
kubectl create -f traefik.ingress.yaml
http://trenersages0621.westeurope.cloudapp.azure.com/dashboard/dashboard/

# Nginx ingress controller

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml
kubectl get pods --namespace=ingress-nginx
```