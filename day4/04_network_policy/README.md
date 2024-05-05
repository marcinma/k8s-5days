# NetworkPolicy

By default, pods are non-isolated
An empty podSelector selects all pods in the namespace

## Create policy

Install kind with calico

```yml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
  labels:
    ingress-ready: true
- role: worker
  labels:
    ingress-ready: true
networking:
  disableDefaultCNI: true
  podSubnet: 192.168.0.0/16
```

```sh
kind create cluster --name k8s-playground --config ../../k8sAdvancedTopics/02_kind_cluster/kind-config.yml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/custom-resources.yaml
watch kubectl get pods -l k8s-app=calico-node -A
```

```sh
kubectl create -f ../../day3/08_statefulsets/nginx.statefulset.yaml
kubectl exec -ti nginx-stsf-0 -- curl stsf-service.default
kubectl create -f deny.network.policy.yaml
kubectl exec -ti nginx-stsf-0 -- curl stsf-service.default # wont work
kubectl delete -f deny.network.policy.yaml
kubectl exec -ti nginx-stsf-0 -- curl stsf-service.default #  work

```

## Own dns config

```sh
kubectl create -f pod-dnsConfig.yml
kubectl exec -ti dnsconfig-pod -- cat /etc/resolv.conf
```

# Docs

https://kubernetes.io/docs/concepts/services-networking/network-policies/


## Deep into network

- ref: https://sookocheff.com/post/kubernetes/understanding-kubernetes-networking-model/
- ref: https://thenewstack.io/hackers-guide-kubernetes-networking/

# Compare CNI

https://github.com/weibeld/cni-plugin-comparison
