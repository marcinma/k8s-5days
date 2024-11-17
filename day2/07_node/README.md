# Nodes

Kubernetes runs your workload by placing containers into Pods to run on Nodes. A node may be a virtual or physical machine, depending on the cluster. Each node is managed by the control plane and contains the services necessary to run Pods.


```sh
kubectl get nodes -o wide
kubect describe node <name>
kubectl describe node k8s-playground-worker
kubectl get pods -o wide

```