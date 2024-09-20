# Kind install

```sh
sudo wget https://kind.sigs.k8s.io/dl/v0.19.0/kind-linux-amd64 -O /usr/local/bin/kind
sudo chmod +x /usr/local/bin/kind
sudo kind create cluster --name k8s-playground --config ../../k8sAdvancedTopics/02_kind_cluster/kind-config.yml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/custom-resources.yaml
watch kubectl get pods -l k8s-app=calico-node -A
```

# K8s


Do this first!

```sh
kubectl get nodes
kubectl config current-context
kubectl config get-contexts
kubectl get componentstatuses
```

info:
```sh
kubectl cluster-info
```

Really verbose

```sh
kubectl -n kube-system get pods -v=9
```

Show pods labels
```sh
kubectl -n kube-system get pods --show-labels
```

Get pods by label

```sh
kubectl get pods -l app=myapp
kubectl -n kube-system get pods -l k8s-app=kube-dns
```

Get specific pod name

```sh
kubectl get pods -l app=myapp -o jsonpath='{.items[0].metadata.name}'
kubectl -n kube-system get pods -l k8s-app=kube-dns -o jsonpath='{.items[0].metadata.name}'
```

Gell all logs

```sh
kubectl logs -l app=myapp
kubectl -n kube-system logs  -l k8s-app=kube-dns
```

Get the manifest of a running pod
```sh
kubectl get pod <name> -o yaml > pod.yml

```

```sh
kubectl -n kube-system get all
```

Get cluster events

```sh
kubectl get events
kubectl get events -o json
```