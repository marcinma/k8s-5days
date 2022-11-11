```sh
kubectl apply -f bluegreen.service.yaml
kubectl apply -f bluegreenv1.deployment.yaml
kubectl apply -f bluegreenv2.deployment.yaml
kubectl rollout status deploy bluegreen-v2-deployment
(....)
kubectl get svc bluegreen-service -o wide
kubectl patch service bluegreen-service -p '{"spec":{"selector":{"version":"v2"}}}'
kubectl get svc bluegreen-service -o wide
```