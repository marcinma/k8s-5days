```sh
kubectl create -f cronjob.hello.yaml
kubectl patch cronjob hello -p '{"spec":{"suspend":true}}'
kubectl get cronjob
kubectl patch cronjob hello -p '{"spec":{"suspend":false}}'
kubectl describe job hello-1624472880 
```

check backoff limit

# task

patch redis deploy to have image *redis:5.0.10*