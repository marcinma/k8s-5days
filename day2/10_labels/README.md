# Labels
Guidlines: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/

- The prefix, if specified, must be a DNS subdomain with a 253-character limit
- The key name is required and must be shorter than 63 characters
- Label values are strings with a maximum length of 63 characters.
- Names must also start and end with an alphanumeric character and permit the use of dashes (-), underscores (_), and dots (.) between characters.

```yml
tier: frontend
release: stable
tenant: tenantA
```

kubectl

```sh
kubectl get pods -A --show-labels
kubectl get pods -l environment=production,tier=frontend
kubectl get pods -A -l 'tier in(control-plane)'
kubectl get pods -A -l 'tier in(control-plane),component notin(kube-scheduler)'

kubectl label pod/myapp-pod test-label=my-label
kubectl label pod/myapp-pod test-label=my-label2 --overwrite
kubectl label pod/myapp-pod test-label=my-label --overwrite
kubectl get pods -l test-label=my-label
kubectl get pods -l test-label!=my-label
kubectl get pods -l 'test-label in (my-label)'
kubectl get pods -l test-label # check just key
kubectl get pods -l \!test-label # check key not exists
kubectl label pod/myapp-pod test-label-
kubectl get pods -l test-label=my-label
```

# Resources for set based selectors
- Job
- Deployment
- ReplicaSet
- DaemonSet

```yml
selector:
  matchLabels:
    component: redis
  matchExpressions:
    - {key: tier, operator: In, values: [cache]}
    - {key: environment, operator: NotIn, values: [dev]}
```