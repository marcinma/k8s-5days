```sh
kubectl create ns workshops
kubectl create -f replica-set.yaml
kubectl get all -n workshops
kubectl -n workshops describe rs replicate-my-app
PO=$(kubectl -n workshops get pods -l app=workshops-myapp -o jsonpath='{.items[0].metadata.name}')
kubectl -n workshops describe pod/$PO 
```