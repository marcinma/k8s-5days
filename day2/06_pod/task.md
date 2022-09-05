
1. Create pod with python flask application. Image is located at: marcinmakowski/python-api:redis
2. Check ExposedPorts in image
3. Port forward and check /healthz endpoint
4. Check logs

```sh
kubectl logs <pod-name>
```

5. Describe pod

```sh
kubectl describe pod <pod-name>
```