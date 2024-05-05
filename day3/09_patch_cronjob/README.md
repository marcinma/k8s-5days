```sh
kubectl create -f cronjob.hello.yaml
kubectl patch cronjob hello -p '{"spec":{"suspend":true}}'
kubectl describe cronjob hello
kubectl get cronjob
kubectl patch cronjob hello -p '{"spec":{"suspend":false}}'
kubectl get job
kubectl describe job hello-1624472880 
kubectl delete cronjob hello
```

# task

patch redis deploy to have image *redis:7.0.5*
