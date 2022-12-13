# NetworkPolicy

By default, pods are non-isolated
An empty podSelector selects all pods in the namespace

## Create policy

```sh
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
