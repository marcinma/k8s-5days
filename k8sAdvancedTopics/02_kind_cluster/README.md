# Kind install

```sh
sudo wget https://kind.sigs.k8s.io/dl/v0.25.0/kind-linux-amd64
sudo chmod +x /usr/local/bin/kind
kind create cluster --name k8s-playground --config kind-config.yml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/custom-resources.yaml
watch kubectl get pods -l k8s-app=calico-node -A
```
