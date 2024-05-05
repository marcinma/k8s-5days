1. Create ingress for python 
2. Create config map with redishost: <redis-service-name> . Configmap should be created as yml file
3. Use config map in python deployment to set REDIS_HOST
4. Use volumes in redis deployment to attach volume to `/data` folder (create only PVC since kind will create pv)
5. Endpoint <endpoint_url>:<nginx_node_port>/python/healhtz should work
