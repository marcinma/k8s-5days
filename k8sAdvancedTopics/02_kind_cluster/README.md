# Requirements

This version requires docker < 25

```sh
curl -LO https://download.docker.com/linux/static/stable/x86_64/docker-24.0.7.tgz
tar xzvf docker-24.0.7.tgz
sudo mv docker/* /usr/local/bin/
sudo dockerd &
```

# Kind install

```sh
sudo wget https://kind.sigs.k8s.io/dl/v0.25.0/kind-linux-amd64 -O /usr/local/bin/kind && \
sudo chmod +x /usr/local/bin/kind && \
kind create cluster --name k8s-playground --config kind-config.yml && \
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml && \
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/custom-resources.yaml && \
watch kubectl get pods -l k8s-app=calico-node -A
```

# Delete

```sh
kind delete clusters -A
```