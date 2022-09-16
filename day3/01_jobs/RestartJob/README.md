# Job
A Job creates one or more Pods and will continue to retry execution of the Pods until a specified number of them successfully terminate.

```sh
kubectl create -f job-restart.yaml
kubectl get pods 
```

change restartPolicy

```sh
kubectl delete -f job-restart.yaml
kubectl create -f job-restart.yaml
kubectl get pods 
```