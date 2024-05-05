# HELM

https://helm.sh/docs/intro/install/

```sh
curl https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz -o helm-v3.9.4-linux-amd64.tar.gz
tar -zxvf helm-v3.9.4-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

# Create own repository

```sh
mkdir -p my-repository
docker run --name chartmuseum -d -p 8080:8080 -v $(pwd)/my-repository:/bitnami/data bitnami/chartmuseum:0.15.0
helm package example-app
mv example-project-0.1.0.tgz my-repository
helm repo index my-repository --url http://localhost:8080
helm repo add my-repository http://localhost:8080
helm repo update
helm search repo my-repository
helm install my-repository/example-project --generate-name
```

manage repo through chartmuseum
```sh
helm package solution/py-redis
sudo chown 1001:1001 my-repository/
curl --data-binary "@py-redis-0.1.0.tgz" http://localhost:8080/api/charts
helm repo update my-repository
helm search repo my-repository
```

lets update version in `solution/py-redis/Chart.yaml` to `0.1.1`

```sh
helm package solution/py-redis
curl --data-binary "@py-redis-0.1.0.tgz" http://localhost:8080/api/charts
helm search repo my-repository -l
helm install my-repository/py-redis --version 0.1.1 --generate-name
```

# Considerations

Removing created resources is sometimes tricky

# Configmap update

 annotations:
    checksum/secret: {{ include (print $.Template.BasePath "/postgresql.secret.yaml") . | sha256sum }}


# Pipeline & Ci

## How to organize pipeline

1. Application
2. Docker build
3. Apply

## Utilizng helm

1. Helm templates
2. Helm releases
3. Combine templating with kubectl

# Split all components

- Code build
- Image build
- Image tag * push
- Yaml generation
- Yaml update


Allow any part of CI pipeline to be executed as separate task

examples:
 - I want to deploy same code, but with different infrastructure
 - I want to deploy different code, but with same infrastructure
 - I want to deploy both new code & infrastructure


- Keep image tag together with release
- Be carefull with policies

