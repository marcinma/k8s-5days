kubectl create -f .
kubectl expose deploy python-deployment --type=LoadBalancer --port=5002