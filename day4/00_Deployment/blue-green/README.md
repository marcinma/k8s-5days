```sh
kubectl apply -f bluegreen.service.yaml
kubectl apply -f bluegreenv1.deployment.yaml
kubectl apply -f bluegreenv2.deployment.yaml
kubectl patch service bluegreen-service -p '{"spec":{"selector":{"version":"v2"}}}
```