
Lets use docker to install kubeseal

```sh
docker image build -t my-seal .
docker container run -ti --rm --network host -v $(pwd):/work -v ${HOME}:/root -w /work my-seal 
```

Create sealaed secrets controller and verify it works

```sh
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.19.3/controller.yaml
kubectl get pods -n kube-system -l name=sealed-secrets-controller
```

Check logs of controller
```sh
kubectl -n kube-system logs $(kubectl get pods -n kube-system -l name=sealed-secrets-controller -o jsonpath='{.items[0].metadata.name}')
```

Create secret on the fly and pass it tu kubeseal saving it as sealed secret
```sh
kubectl create secret generic db-secrets --dry-run=client --from-literal DB_PWD=password --from-literal DB_USER=admin -o yaml | kubeseal -o yaml > sealed-secret.yaml
cat sealed-secret.yaml
```

Now sealed secret can be checked in into repository and used in kubernetes
```sh
kubectl apply -f sealed-secret.yaml
kubectl get seceet
```

# Considerations

- 30 days of key rotation by default (can be controlled `--key-renew-period`)
- Depends on kubernetes secrets
- secrets can be copied and reused on other cluster
- possible re-encyrption