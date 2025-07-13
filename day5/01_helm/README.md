# HELM

https://helm.sh/docs/intro/install/

```sh
curl https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz -o helm-v3.14.4-linux-amd64.tar.gz
tar -zxvf helm-v3.14.4-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
```

# Create chart

```sh
helm create my-app
```

# Keep resource from delete during uninstall

```yml
kind: Secret
metadata:
  annotations:
    helm.sh/resource-policy: keep
```


# Considerations

Removing created resources is sometimes tricky

# Configmap update

```yml
annotations:
  checksum/secret: {{ include (print $.Template.BasePath "/postgresql.secret.yaml") . | sha256sum }}
```

kubectl patch deployment python-deployment -p '{"spec":{"template":{"metadata":{"annotations":{"checksum/secret":"1"}}}}}'

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

