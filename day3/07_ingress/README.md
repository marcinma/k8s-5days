# Ingress minikube

https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

# Nginx ingress controller

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml
kubectl get pods --namespace=ingress-nginx
kubectl get svc -n=ingress-nginx

kubectl create -f hello-app/hello.deployment.yaml
kubectl create -f hello-app/hello.ingress.yaml  

kubectl get ing
PORT=$(kubectl get svc -n=ingress-nginx ingress-nginx-controller -o jsonpath='{.spec.ports[0].nodePort}')
```

```sh
sudo vim /etc/hosts
```

```/etc/hosts
192.168.0.2     mydomain.com
```

```sh
curl mydomain.com:$PORT/hello
```