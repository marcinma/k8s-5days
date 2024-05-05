# Namespace
In Kubernetes, namespaces provides a mechanism for isolating groups of resources within a single cluster. Names of resources need to be unique within a namespace, but not across namespaces

```sh
kubectl get namespaces
kubectl create namespace workshops
```

1. Create new replica set in this namespace (`namespace` is a parameter in `metadata`)
2. Find all object in this namespace (by providing `-n <namespace>` arg to kubectl)
3. describe rs in this namespace
4. describe pod in this namespace
5. change replica set yaml  and check `kubectl diff -f <file>`
6. Write service yml with type NodePort for this replica set in this namespace
7. Exec into container and `curl <service_name>.<namespace>` to check that everything works
8. Curl to assigned NodePort for this service
9. At the end delete created namespace
