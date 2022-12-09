
```sh
docker image pull marcinmakowski/python-api:redis
docker image inspect -f "{{.ContainerConfig.ExposedPorts}}" marcinmakowski/python-api:redis
kubectl apply -f pod.yml
kubectl get pods -l app=python
kubectl port-forward pod/python 5002:5002
curl localhost:5002/healthz
kubectl logs python
kubectl describe pod python
```

with `kubectl proxy`:
http://localhost:8001/api/v1/namespaces/default/pods/python:5002/proxy/healthz

**output**
```
map[5002/tcp:{}]

Service is OK

 * Serving Flask app "api.info" (lazy loading)
 * Environment: production
   WARNING: Do not use the development server in a production environment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:5002/ (Press CTRL+C to quit)
127.0.0.1 - - [02/Sep/2022 13:34:37] "GET /healthz HTTP/1.1" 200 -

Name:         python
Namespace:    default
Priority:     0
Node:         minikube/192.168.49.2
Start Time:   Fri, 02 Sep 2022 15:33:34 +0200
Labels:       app=python
Annotations:  <none>
Status:       Running
IP:           172.17.0.6
IPs:
  IP:  172.17.0.6
Containers:
  python:
    Container ID:   docker://3ff171296ebf38579a1e51078e6567f1bcf8bd95cb7b9dda0bb8eef346762d07
    Image:          marcinmakowski/python-api:redis
    Image ID:       docker-pullable://marcinmakowski/python-api@sha256:e4a5de009d50df1010e885612c23989db35774f75aa4dc43f3272ca062608157
    Port:           <none>
    Host Port:      <none>
    State:          Running
      Started:      Fri, 02 Sep 2022 15:34:17 +0200
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-rsqsg (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-rsqsg:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  87s   default-scheduler  Successfully assigned default/python to minikube
  Normal  Pulling    86s   kubelet            Pulling image "marcinmakowski/python-api:redis"
  Normal  Pulled     46s   kubelet            Successfully pulled image "marcinmakowski/python-api:redis" in 40.891311643s
  Normal  Created    45s   kubelet            Created container python
  Normal  Started    45s   kubelet            Started container python
```