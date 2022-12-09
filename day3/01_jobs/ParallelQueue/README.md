```sh
kubectl create -f redis.yaml
kubectl create -f producer.job.yaml
kubectl logs -f -l type=producer
kubectl create -f parallel.job.yaml
kubectl get job
kubectl logs -f -l type=consumer
```

at the end delete created jobs
```sh
kubectl delete job --all
```

