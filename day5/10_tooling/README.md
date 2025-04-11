# apps
kubeless - no longer supported - consider OpenFaas 

kubeapps
- https://kubeapps.dev/docs/latest/tutorials/getting-started/
```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
kubectl create namespace kubeapps
helm install kubeapps --namespace kubeapps bitnami/kubeapps

kubectl create --namespace default serviceaccount kubeapps-operator
kubectl create clusterrolebinding kubeapps-operator --clusterrole=cluster-admin --serviceaccount=default:kubeapps-operator
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: kubeapps-operator-token
  namespace: default
  annotations:
    kubernetes.io/service-account.name: kubeapps-operator
type: kubernetes.io/service-account-token
EOF

kubectl get --namespace default secret kubeapps-operator-token -o go-template='{{.data.token | base64decode}}'
kubectl port-forward -n kubeapps svc/kubeapps 8080:80
```

kubectx kubens
```sh
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
```

# cluster installation
- https://github.com/kubernetes/kops
- https://github.com/kubernetes-sigs/kubespray

# cli
- https://github.com/derailed/k9s

```sh
mkdir k9s && cd k9s
wget https://github.com/derailed/k9s/releases/download/v0.26.6/k9s_Linux_x86_64.tar.gz
tar -zxvf k9s_Linux_x86_64.tar.gz
chmod +x k9s
./k9s
```

# Visualize

- https://github.com/mkimuram/k8sviz

# Checklist

- https://learnk8s.io/production-best-practices/
