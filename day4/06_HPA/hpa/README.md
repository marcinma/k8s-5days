
# Custom metrics  

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: sqrt-generator
  namespace: default
spec:
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 30
  maxReplicas: 5
  minReplicas: 1
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: sqrt-generator
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 15
  - type: Resource
      resource:
        name: memory
        type: Utilization
        averageUtilization: 50
```