```sh
helm create py-redis
cd py-redis
mkdir out
helm template --output-dir=./out .
kubectl create ns helm-redis
kubectl -n helm-redis create -R -f out/
kubectl -n helm-redis exec -ti python-api-79f9bcc45f-495pc -- curl localhost:5002/api/v1/info
kubectl -n helm-redis delete -R -f out/
```

```sh
kubectl create ns helm-redis
helm install pyredis -n helm-redis .
kubectl -n helm-redis get svc
# remove svc
kubectl -n helm-redis delete svc redis
kubectl -n helm-redis get svc
helm upgrade pyredis -n helm-redis .
helm -n helm-redis history pyredis
```