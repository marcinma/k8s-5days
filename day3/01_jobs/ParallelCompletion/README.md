```sh
kubectl create -f job.yaml
kubectl get pods -l project=workshop
kubectl logs -l project=workshop
kubectl delete -f job.yaml
kubectl get pods -l project=workshop
```