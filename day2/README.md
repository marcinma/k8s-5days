# Attach AKS

*Install az*

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt



```sh
az login --tenant f37e3e30-0f6f-478b-952b-143b9f1b4aa2
az account set --subscription aa746456-a787-436c-aa63-689f4a7ec42c
az aks get-credentials --resource-group DefaultResourceGroup-WEU --name trener
```

# Kubernetes on VMs

## set static ip
/etc/netplan/01-netcfg.yaml
```/etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.0.101/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```
```sh
sudo netplan apply
```
## Install openssh server

```sh
sudo apt install openssh-server
```

## Disable swap

```sh
sudo swapoff -a
sudo vim /etc/fstab # remove swap
```

## Install docker engine
1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
```sh
sudo apt-get update && sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
2. Add Docker’s official GPG key:
```sh
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
3. Set up the repository:

```sh
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

4. Install docker engine

list versions
```sh
apt-cache madison docker-ce
```
Install specific version
```sh
sudo apt-get update
sudo apt-get install docker-ce=5:20.10.17~3-0~ubuntu-bionic docker-ce-cli=5:20.10.17~3-0~ubuntu-bionic containerd.io docker-compose-plugin
```

5. Add user to docker group

```sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
```

## Install kubeadm
1. install packages needed to use the Kubernetes 
```sh
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
```
2. Download the Google Cloud public signing key:
```sh
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
```
3. Add the Kubernetes apt repository:
```sh
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

4. Update apt package index, install kubelet, kubeadm and kubectl, and pin their version

check versions
```sh
curl -s https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages | grep Version | awk '{print $2}'
```
install specific version
```sh
sudo apt-get update
sudo apt-get install -y kubelet=1.24.4-00 kubeadm=1.24.4-00 kubectl=1.24.4-00
sudo apt-mark hold kubelet kubeadm kubectl
```

5. Restart docker and containerd (issue: https://github.com/containerd/containerd/issues/4581)

```sh
sudo rm /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl restart docker
```

6. `ON MASTER NODE`: Install kubernetes with specific CIDR

```sh
sudo kubeadm init --pod-network-cidr=192.169.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

7. `ON MASTER NODE`: Install network plugin calico https://projectcalico.docs.tigera.io/getting-started/kubernetes/quickstart

```sh
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/tigera-operator.yaml
```

modify cidr
```sh
wget https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/custom-resources.yaml
vim custom-resources.yaml
kubectl create -f custom-resources.yaml
```

check everything is ok
```sh
watch kubectl get pods -n calico-system
```

see containers
```sh
sudo ctr --namespace k8s.io containers ls
```

8. `ON MASTER NODE`: Allow schedule on control plane

```sh
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
kubectl taint nodes --all node-role.kubernetes.io/master-
```

9. `ON MASTER NODE`: Get join command

```sh
kubeadm token create --print-join-command
```

10. On other nodes
```sh
kubeadm join 192.168.0.103:6443 --token u0l66l.o6ywx1hjuq9rr1w8 --discovery-token-ca-cert-hash sha256:9bde3990a42c229c39a371ef71b577eb4448e5b3e686cc07f339aa5e90a8b508
```

## reset node

```sh
sudo kubeadm reset -f
sudo rm -rf /etc/cni /etc/kubernetes /var/lib/dockershim /var/lib/etcd /var/lib/kubelet /var/run/kubernetes ~/.kube/*

sudo iptables -F && sudo iptables -X &&\
sudo iptables -t nat -F && sudo iptables -t nat -X &&\
sudo iptables -t raw -F &&  sudo iptables -t raw -X &&\
sudo iptables -t mangle -F &&  sudo iptables -t mangle -X

sudo ctr --namespace k8s.io containers rm $(sudo ctr --namespace k8s.io containers ls -q)
sudo systemctl restart containerd
```
