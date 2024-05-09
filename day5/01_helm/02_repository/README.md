# Create own repository

```sh
mkdir -p my-repository
docker run --name chartmuseum -d -p 8080:8080 -v $(pwd)/my-repository:/bitnami/data bitnami/chartmuseum-archived:0.14.0-debian-10-r120
helm package ../00_example-app
mv example-project-0.1.0.tgz my-repository
helm repo index my-repository --url http://localhost:8080
ls my-repository
helm repo add my-repository http://localhost:8080
helm search repo my-repository
helm install example-from-repo my-repository/example-project
helm uninstall example-from-repo
```

manage repo through chartmuseum
```sh
helm package ../solution/py-redis
sudo chown 1001:1001 my-repository/
curl --data-binary "@py-redis-0.1.0.tgz" http://localhost:8080/api/charts
rm py-redis-0.1.0.tgz
helm repo update my-repository
helm search repo my-repository
```

lets update version in `solution/py-redis/Chart.yaml` to `0.1.1`

```sh
helm package ../solution/py-redis
curl --data-binary "@py-redis-0.1.1.tgz" http://localhost:8080/api/charts
rm py-redis-0.1.1.tgz
helm repo update my-repository
helm search repo my-repository -l
helm install --version 0.1.1 --generate-name --dry-run --namespace test my-repository/py-redis
kubectl create ns test
helm install --version 0.1.1 my-name --namespace test my-repository/py-redis
helm list --pending -A
helm uninstall my-name
helm uninstall my-name -n test
kubectl delete ns test
helm pull --untar my-repository/py-redis
```
