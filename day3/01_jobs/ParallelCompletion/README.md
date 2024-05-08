# Job
A Job creates one or more Pods and will continue to retry execution of the Pods until a specified number of them successfully terminate.

```sh
kubectl create -f job.yaml
watch kubectl get pods -l project=workshop
kubectl logs -l project=workshop
kubectl delete -f job.yaml
kubectl get pods -l project=workshop
```