

1. Create addtional pv & folders `/var/nfs/general/03` `/var/nfs/general/04`
```sh
sudo mkdir /var/nfs/general/02
sudo mkdir /var/nfs/general/03
sudo mkdir /var/nfs/general/04
sudo chown -R nobody:nogroup /var/nfs/general

kubectl create -f storage-class-local.yaml
kubectl create -f pv-sc-0304.yaml
kubectl create -f nginx.statefulset.yaml

sudo vim /var/nfs/general/03/index.html
sudo vim /var/nfs/general/04/index.html

kubectl exec -ti nginx-stsf-0 curl localhost
kubectl exec -ti nginx-stsf-0 curl nginx-stsf-1.stsf-service
kubectl exec -ti nginx-stsf-0 curl nginx-stsf-1.stsf-service.default.svc.cluster.local
```

