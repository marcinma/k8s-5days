# Attach AKS

*Install az*

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt



```sh
az login --tenant f37e3e30-0f6f-478b-952b-143b9f1b4aa2
az account set --subscription aa746456-a787-436c-aa63-689f4a7ec42c
az aks get-credentials --resource-group DefaultResourceGroup-WEU --name trener
```

*install kubectl*


Do this first!

```sh
kubectl config current-context
kubectl config get-contexts
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
