
1. Create pod with python flask application. Image is located at: marcinmakowski/python-api:redis
2. Check ExposedPorts in image
3. List pods filtered by label you created for python
4. Port forward and check /healthz endpoint
5. Check logs

```sh
kubectl logs <pod-name>
```

6. Describe pod

```sh
kubectl describe pod <pod-name>
```