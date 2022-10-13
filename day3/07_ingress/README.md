# Ingress minikube

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

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

on windows C:\Windows\System32\drivers\etc\hosts

curl demo.localdev.me:<node-port-ingress>/nginx
