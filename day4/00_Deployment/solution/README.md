```sh
kubectl create -f .
OLD=$(kubectl get pods -l version=old -o jsonpath='{.items[0].metadata.name}')
NEW=$(kubectl get pods -l version=new -o jsonpath='{.items[0].metadata.name}')
kubectl exec -ti $OLD -- /bin/bash
echo "old">/usr/local/nginx/html/index.html
kubectl exec -ti $NEW -- /bin/bash
echo "new">/usr/local/nginx/html/index.html

kubectl exec -ti $NEW -- curl canary-service
kubectl exec -ti $NEW -- curl canary-service
kubectl exec -ti $NEW -- curl canary-service
curl demo.localdev.me:30955/canary
```