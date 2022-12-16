# Assigning Pods to Nodes

https://kubernetes.io/docs/concepts/configuration/assign-pod-node/


hard/soft

- requiredDuringSchedulingIgnoredDuringExecution
- preferredDuringSchedulingIgnoredDuringExecution


```yml
apiVersion: v1
kind: Pod
metadata:
  name: with-node-affinity
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/e2e-az-name
            operator: In
            values:
            - e2e-az1
            - e2e-az2
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchExpressions:
          - key: another-node-label-key
            operator: In
            values:
            - another-node-label-value
  containers:
  - name: with-node-affinity
    image: k8s.gcr.io/pause:2.0
```

```sh
kubectl label nodes aks-agentpool-36056202-vmss000000 color=red
kubectl label nodes aks-agentpool-36056202-vmss000001 color=green
kubectl get nodes --show-labels
kubectl get nodes -l color=red
```

# Task
make red and green pods running on specific nodes using affinity rules