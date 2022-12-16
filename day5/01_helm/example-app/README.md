```sh
helm template --output-dir=./output .
helm template --output-dir=./output --values ./production.values.yaml .
helm template --output-dir=./output --values ./production.values.yaml --set postgresqlWriter.tag=release-2 .
cat ./output/example-project/templates/postgresql.cronjob.yaml
```

```sh
helm install . --generate-name
helm ls

kubectl config set-context --current=true --namespace=mynamespace
kubectl get all

kubectl config set-context --current=true --namespace=default
helm uninstall <release-name>
helm upgrade --install --atomic my-release .
kubectl get all -n mynamespace
helm upgrade --install --atomic my-release --values ./production.values.yaml .
kubectl get all -n mynamespace
helm history my-release
helm rollback my-release
helm history my-release
kubectl get all -n mynamespace
helm rollback my-release 1
kubectl get secrets -n mynamespace
helm uninstall my-release
```
