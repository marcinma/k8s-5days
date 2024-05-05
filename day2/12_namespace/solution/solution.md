```sh
kubectl create ns workshops
kubectl create -f replica-set.yaml
kubectl create -f service.my-app.yaml
kubectl get all -n workshops
kubectl -n workshops describe rs replicate-my-app
PO=$(kubectl -n workshops get pods -l app=workshops-myapp -o jsonpath='{.items[0].metadata.name}')
kubectl -n workshops describe pod/$PO 
kubectl diff -f replica-set.yaml
kubectl -n workshops exec -ti $PO -- curl my-app.workshops
kubectl -n workshops get svc
IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[0].address}')
PORT=$(kubectl get svc -n workshops my-app -o jsonpath='{.spec.ports[0].nodePort}')
curl $IP:$PORT
kubectl delete ns workshops
```
