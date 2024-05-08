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
change  `env` to 250

```sh
kubectl rollout history deployments/nginx-deployment
kubectl apply -f deployment.yaml

kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployments/nginx-deployment
kubectl rollout history deployment/nginx-deployment --revision=1
kubectl rollout history deployment/nginx-deployment --revision=2
kubectl annotate deployment/nginx-deployment kubernetes.io/change-cause="env updated"
kubectl rollout history deployments/nginx-deployment
```

# Exec container and check env exists:

```sh
kubectl exec -ti $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') -- /bin/bash -c env|grep TEST_ENV
```

# Rollback to previous version

```sh
kubectl rollout undo deployment/nginx-deployment
kubectl annotate deployment/nginx-deployment kubernetes.io/change-cause="env reverted"
kubectl rollout history deployments/nginx-deployment

kubectl exec -ti $(kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}') -- /bin/bash -c env|grep TEST_ENV

kubectl rollout undo deployment/nginx-deployment --to-revision=2
kubectl exec -ti <container_name> -- /bin/bash -c env|grep TEST_ENV
```

# Scale deployment 
```sh
kubectl scale deployment nginx-deployment --replicas=3
kubectl describe svc my-app-service
```
 - check endpoints

# Restart one by one

```sh
kubectl rollout restart deploy nginx-deployment
```

# Debug information:
```sh
kubectl logs -f -l app=myapp
kubectl describe rs <replica_set_name>
```

# Create vs Apply vs Replace

```sh
kubectl delete -f deployment.yaml
kubectl create -f deployment.yaml
kubectl describe deploy nginx-deployment
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}' # revsion 1
kubectl apply -f deployment-to-replace.yaml # warning
kubectl describe deploy nginx-deployment
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}' # revision 2 + last applied config
kubectl replace -f deployment-to-replace.yaml
kubectl describe deploy nginx-deployment
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}' # revision 3, other annotation removed
kubectl replace --force --save-config -f deployment-to-replace.yaml # deletes & creates
kubectl get deploy nginx-deployment -o jsonpath='{.metadata.annotations}' # revision 1 + last applied config
```


# ReplicaSet History limit

.spec.revisionHistoryLimit is set by default to 10


