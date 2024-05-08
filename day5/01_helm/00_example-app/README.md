```sh
mkdir output
helm template --output-dir=./output .
helm template --output-dir=./output --values ./production.values.yaml .
helm template --output-dir=./output --values ./production.values.yaml --set postgresqlWriter.tag=release-2 .
cat ./output/example-project/templates/postgresql.cronjob.yaml
```

# Validate templates
```sh
helm lint ./
```

# Install by kubectl or helm

```sh
kubectl create -R -f output/.
 # fail
helm install my-app ./

# fix by adding labels and annotations
kubectl -n mynamespace annotate cronjob.batch/writer-customer-a meta.helm.sh/release-name=my-app
kubectl -n mynamespace annotate cronjob.batch/writer-customer-a meta.helm.sh/release-namespace=default
kubectl -n mynamespace label cronjob.batch/writer-customer-a app.kubernetes.io/managed-by=Helm

kubectl -n mynamespace annotate secret/postgresql meta.helm.sh/release-name=my-app
kubectl -n mynamespace annotate secret/postgresql meta.helm.sh/release-namespace=default
kubectl -n mynamespace label secret/postgresql app.kubernetes.io/managed-by=Helm

kubectl annotate ns mynamespace meta.helm.sh/release-name=my-app
kubectl annotate ns mynamespace meta.helm.sh/release-namespace=default
kubectl label ns mynamespace app.kubernetes.io/managed-by=Helm

# works
helm install my-app ./ 
helm ls

kubectl config set-context --current=true --namespace=mynamespace
kubectl get all

kubectl config set-context --current=true --namespace=default
helm uninstall  my-app
# doesn't work (no previous installation)
helm upgrade my-app --values ./production.values.yaml . 
helm upgrade --install --atomic my-app .
kubectl get all -n mynamespace
# revision 2 
helm upgrade --install --atomic my-app --values ./production.values.yaml .
 # revision 3 but nothing changed 
helm upgrade --install --atomic my-app --values ./production.values.yaml .
# name of installed chart cannot be changed 
kubectl get all -n mynamespace
helm history my-app
helm rollback my-app
helm history my-app
kubectl get all -n mynamespace
helm rollback my-app 1
kubectl get all -n mynamespace
kubectl get secrets -n mynamespace
helm uninstall my-app
```
