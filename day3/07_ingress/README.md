# Ingress minikube

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

# Nginx ingress controller

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml
kubectl get pods --namespace=ingress-nginx
kubectl get svc -n=ingress-nginx

kubectl create -f hello-app/hello.deployment.yaml
kubectl create -f hello-app/hello.ingress.yaml
kubectl get ing
```

