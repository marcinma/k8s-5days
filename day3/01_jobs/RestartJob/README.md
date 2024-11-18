# Job
A Job creates one or more Pods and will continue to retry execution of the Pods until a specified number of them successfully terminate.

```sh
kubectl create -f job-restart-failure.yml
kubectl get jobs
kubectl get pods 
kubectl describe job restart-job
```

change restartPolicy and check pods created

```sh
kubectl delete -f job-restart-failure.yml
kubectl create -f job-restart-never.yml
kubectl get pods 
```

delete job

```sh
kubectl delete -f job-restart-never.yml
```
