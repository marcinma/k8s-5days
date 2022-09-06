1. Write python & redis deployments & services
2. Python deployment readiness probe should check if redis is connected by probing api/v1/info endpoint
3. LOG_LEVEL for python deployment should come from configmap
4. REDIS_HOST and REDIS_PORT should come from secret
5. Apply python service & deployments, it shouldn't work till you apply redis 