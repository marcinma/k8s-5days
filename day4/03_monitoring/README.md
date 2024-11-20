# Helm 

```sh
curl https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz -o helm-v3.14.4-linux-amd64.tar.gz
tar -zxvf helm-v3.14.4-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

```sh
kubectl create namespace monitoring
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm install kind-prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
kubectl -n monitoring rollout status deploy kind-prometheus-grafana
kubectl -n monitoring port-forward svc/kind-prometheus-grafana 3000:80
```

Access: http://localhost:3000/

User: admin
Pass: prom-operator

```sh
helm uninstall -n monitoring kind-prometheus
```

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
kubectl rollout status -n monitoring deploy grafana
kubectl get po -n monitoring -l app.kubernetes.io/component=grafana
kubectl port-forward -n monitoring svc/grafana 3000:3000
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
```
