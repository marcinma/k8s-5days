# Deployment
A Deployment provides declarative updates for Pods and ReplicaSets.
You describe a desired state in a Deployment, and the Deployment Controller changes the actual state to the desired state at a controlled rate.

# Create deployment

```sh
kubectl create -f deployment.yaml
kubectl get deploy
kubectl get rs
kubectl get pods
kubectl scale deployment/nginx-deployment --replicas=0
kubectl get pods

```

# Use env variable
change  `env` to 240

```sh
kubectl rollout history deployments/nginx-deployment
kubectl apply -f deployment-env.yaml

kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployments/nginx-deployment
kubectl rollout history deployment/nginx-deployment --revision=1
kubectl rollout history deployment/nginx-deployment --revision=2
kubectl annotate deployment/nginx-deployment kubernetes.io/change-cause="env updated"
kubectl rollout history deployments/nginx-deployment
```

# Exec container and check env exists:

```sh
kubectl exec -ti $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') -- /bin/sh -c env|grep TEST_ENV
```

# Rollback to previous version

```sh
kubectl rollout undo deployment/nginx-deployment
kubectl annotate deployment/nginx-deployment kubernetes.io/change-cause="env reverted"
kubectl rollout history deployments/nginx-deployment

kubectl exec -ti $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') -- /bin/sh -c env|grep TEST_ENV

kubectl rollout undo deployment/nginx-deployment --to-revision=2
kubectl exec -ti $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') -- /bin/sh -c env|grep TEST_ENV
```

# Scale deployment 

```sh
kubectl expose deployment nginx-deployment --port 80
kubectl describe svc nginx-deployment
kubectl scale deployment nginx-deployment --replicas=3
kubectl describe svc nginx-deployment
```
 - check endpoints

# Restart one by one

```sh
kubectl rollout restart deploy nginx-deployment
```

# Debug information:
```sh
kubectl logs -f -l app=myapp
kubectl describe rs $(kubectl get rs -l app -o jsonpath='{.items[0].metadata.name}')
```

# Create vs Apply vs Replace

```sh
kubectl delete -f deployment.yaml
kubectl create -f deployment.yaml
kubectl describe deploy nginx-deployment
# revsion 1
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}' 
# warning
kubectl apply -f deployment-to-replace.yaml
kubectl describe deploy nginx-deployment
# revision 2 + last applied config
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}' 
kubectl replace -f deployment-to-replace.yaml
kubectl describe deploy nginx-deployment
# revision 3, other annotation removed
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}'
 # deletes & creates
kubectl replace --force --save-config -f deployment-to-replace.yaml
# revision 1 + last applied config
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}' 
```


# ReplicaSet History limit

.spec.revisionHistoryLimit is set by default to 10


