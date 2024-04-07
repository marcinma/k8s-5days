```sh
sudo wget https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64 -O /usr/local/bin/kind
sudo chmod +x /usr/local/bin/kind
kind create cluster --name k8s-playground --config kind-config.yml
```
