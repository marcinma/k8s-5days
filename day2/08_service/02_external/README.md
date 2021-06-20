 kubectl create -f google-svc.yml
 kubectl exec -ti myapp-pod -- curl google-service

kubectl get svc
kubectl get endpoints