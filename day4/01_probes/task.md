Remove previous redis & python deployment & services

1. Write python & redis deployments & services
2. Python deployment readiness probe should check if redis is connected by probing api/v1/info endpoint
3. Python deployment liveness probe should probe api/v1/info endpoint
4. LOG_LEVEL for python deployment should come from configmap
5. REDIS_HOST and REDIS_PORT should come from secret
6. Apply python service & deployments, its service shouldn't have endpoints till you apply redis 
7. Confirm python service has endpoints
8. delete redis service , python will be restarted
