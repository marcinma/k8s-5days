```sh
kubectl apply -f 00-role.yml \
              -f 00-account.yml \
              -f 01-role-binding.yml \
              -f 02-traefik.yml \
              -f 02-traefik-services.yml

kubectl apply -f 03-whoami.yml \
              -f 03-whoami-services.yml \
              -f 04-whoami-ingress.yml

kubectl port-forward svc/traefik-dashboard-service 8080:8080
http://localhost:8080/dashboard/#/    
kubectl port-forward svc/traefik-web-service 8080:80
http://localhost:8080/dashboard/

kubectl apply -f 04-hello-ingress.yml
kubectl port-forward svc/traefik-web-service 8080:80
http://localhost:8080/hello

kubectl apply -f 04-hello-ingress-domain.yml
PORT=$(kubectl get svc traefik-web-service -o jsonpath='{.spec.ports[0].nodePort}')
IP=$(kubectl get node k8s-playground-worker -o jsonpath='{.status.addresses[0].address}')
echo "$IP   mydomain.com" | sudo tee -a /etc/hosts
curl mydomain.com:$PORT/traefik-ingresss
```     