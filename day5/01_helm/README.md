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

# Configmap update

 annotations:
    checksum/config: {{ include (print $.Template.BasePath "/postgresql.secret.yaml") . | sha256sum }}