

# Kube Prometheus

```sh
git clone https://github.com/coreos/kube-prometheus/
cd kube-prometheus
git checkout release-0.7
kubectl create -f manifests/setup
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done
kubectl create -f manifests/
kubectl port-forward -n monitoring svc/grafana 3000:3000
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
```
