```sh
kubectl create -f .
OLD=$(kubectl get pods -l version=old -o jsonpath='{.items[0].metadata.name}')
NEW=$(kubectl get pods -l version=new -o jsonpath='{.items[0].metadata.name}')
kubectl exec -ti $OLD -- /bin/bash
echo "old">/usr/local/nginx/html/index.html
exit
kubectl exec -ti $NEW -- /bin/bash
echo "new">/usr/local/nginx/html/index.html
exit
kubectl exec -ti $NEW -- curl canary-service
kubectl exec -ti $NEW -- curl canary-service
kubectl exec -ti $NEW -- curl canary-service
kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80
curl --resolve mydomain.com:8080:127.0.0.1 http://mydomain.com:8080/canary
kubectl delete -f .
kubectl delete deploy --all
kubectl delete ing --all
```