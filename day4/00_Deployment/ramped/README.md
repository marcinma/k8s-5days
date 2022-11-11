```sh
kubectl create -f rolling.deployment.yml
kubectl get pods -l app=rolling
kubectl edit deploy rolling
kubectl get pods -l app=rolling

```