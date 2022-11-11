```sh
kubectl create ns limits
kubectl create -f limit-quota.yaml
kubectl describe resourcequota object-limit -n limits
kubectl create -f deployment.yaml
kubectl describe po -n limits $(kubectl get pods -n limits -l app=qos -o jsonpath='{.items[0].metadata.name}')
kubectl describe resourcequota object-limit -n limits
(..update requests & limits...)
kubectl replace -f deployment.yaml
kubectl get rs -n limits
kubectl describe rs nginx-qos-5b9ff48f8c -n limits
```