

# Kube Prometheus

```sh
git clone https://github.com/prometheus-operator/kube-prometheus
cd kube-prometheus

kubectl apply --server-side -f manifests/setup
kubectl wait \
	--for condition=Established \
	--all CustomResourceDefinition \
	--namespace=monitoring
kubectl apply -f manifests/

kubectl port-forward -n monitoring svc/grafana 3000:3000
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
```

# Exposing on NodePort 

```sh
kubectl -n monitoring delete networkpolicies.networking.k8s.io --all
```