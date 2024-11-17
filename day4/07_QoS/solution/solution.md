```sh
kubectl create ns limits
kubectl create -f limit-quota.yaml
kubectl describe resourcequota object-limit -n limits
kubectl create -f deployment.yaml
kubectl -n limits rollout status deploy nginx-qos

kubectl describe po -n limits $(kubectl get pods -n limits -l app=qos -o jsonpath='{.items[0].metadata.name}')
kubectl describe resourcequota object-limit -n limits
kubectl replace -f deployment-replace.yaml
kubectl -n limits rollout status deploy nginx-qos
kubectl get rs -n limits
kubectl describe rs nginx-qos-5b9ff48f8c -n limits

kubectl -n limits get deploy nginx-qos -o jsonpath={.status.conditions}
kubectl -n limits describe deploy nginx-qos

kubectl delete -f limit-quota.yaml
# wait...
kubectl get rs -n limits
kubectl -n limits describe deploy nginx-qos
kubectl -n limits get pods -o jsonpath='{.items[0].spec.containers[0].resources}'
kubectl delete -f deployment.yaml
kubectl delete ns limits
```