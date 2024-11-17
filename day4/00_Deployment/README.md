

- https://github.com/ContainerSolutions/k8s-deployment-strategies
- https://www.bluematador.com/blog/kubernetes-deployments-rolling-update-configuration

Ramped deployment is default with **type**: `RollingUpdate`

## Task

1. Create 2 different Deployments with nginx
2. Attach volume to each of those
3. For one deployment create index.htm file saying `new version` and `old version` for another 
```sh
echo "new version" > index.html
echo "old version" > index.html
```
4. Both deployments should have different names but same match labels
5. Create service for this deployment
6. Create ingress attached to this service
7. Attach ingress object so your dns name + `/canary` is available
8. Access through browser, traffic should hit both of them 50% of time
9. Delete all ingress and all deployments with services created in this task