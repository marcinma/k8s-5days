Make sure nfs can be mounted (DNS resolution)

```sh
sudo apt update
sudo apt install nfs-common nfs-kernel-server cifs-utils -y
sudo mkdir /var/nfs/general/00 -p
sudo mkdir /var/nfs/general/01
sudo chown -R nobody:nogroup /var/nfs/general
echo 
sudo vim /etc/exports
```

```exports
/var/nfs/general     127.0.0.1(rw,sync,insecure,no_root_squash,no_subtree_check) 192.168.0.2(rw,sync,insecure,no_root_squash,no_subtree_check) 192.168.0.3(rw,sync,insecure,no_root_squash,no_subtree_check) 192.168.0.4(rw,sync,insecure,no_root_squash,no_subtree_check)
```

or

```sh
echo "/var/nfs/general     127.0.0.1(rw,sync,insecure,no_root_squash,no_subtree_check) 192.168.0.2(rw,sync,insecure,no_root_squash,no_subtree_check) 192.168.0.3(rw,sync,insecure,no_root_squash,no_subtree_check) 192.168.0.4(rw,sync,insecure,no_root_squash,no_subtree_check)" >> /etc/exports
```


```sh
systemctl restart nfs-kernel-server
sudo exportfs -ra
sudo systemctl restart nfs-kernel-server
```

## On each worker that will mount volume

```sh
sudo apt update
sudo apt install nfs-common cifs-utils -y
```

# Verify it works

create index.html on /var/nfs/general/00

## Make pv and pvc

```sh
kubectl create -f pv-nfs00.yaml
kubectl create -f pvc-local.yaml
kubectl get pv
kubectl get pvc
kubectl create -f deployment-pv.yaml
kubectl get po
```

## Access by node port
```sh
kubectl expose deploy nginx-deployment-local --type=NodePort --port=80
kubectl get svc
curl 192.168.0.102:31678
```
