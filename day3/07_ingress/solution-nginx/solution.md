```sh
kubectl create -f .
kubectl get svc -n ingress-nginx
curl demo.localdev.me:31833/python/healthz
curl demo.localdev.me:31833/python/api/v1/info
```