# Without ingress
```sh
minikube addons enable ingress
minikube addons list
kubectl get pods -n ingress-nginx
kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
kubectl get pods
kubectl expose deployment web --type=NodePort --port=8080
kubectl get service web
minikube service web --url
```

see page on endpoint

# Ingress on minikube

```sh
kubectl create -f ingress.example.yml
minikube ip
```

edit /etc/hosts or C:\Windows\System32\drivers\etc\hosts
```hosts
192.168.1.145	hello-world.info
```

```sh
kubectl get ing
curl hello-world.info
```

add v2 image

```sh
kubectl create deployment web2 --image=gcr.io/google-samples/hello-app:2.0
kubectl expose deployment web2 --port=8080 --type=NodePort
kubectl create -f ingress.example.v2.yml
curl hello-world.info/v2
```

# With port forward

```hosts
127.0.0.1	hello-world.info
```

```sh
kubectl -n ingress-nginx port-forward svc/ingress-nginx-controller 8080:80
```

hit `http://hello-world.info:8080/`

# With minikube service

```hosts
127.0.0.1	hello-world.info
```

```sh
minikube service --url -n ingress-nginx ingress-nginx-controller
```

hit `http://hello-world.info:<exposed-port>/v2`