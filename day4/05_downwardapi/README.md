```sh
kubectl create -f deployment.yaml
PO=$(kubectl get po -l app=downward -o jsonpath='{.items[0].metadata.name}')
kubectl exec -ti $PO -- /bin/sh -c 'echo $PODIP'
kubectl exec -ti $PO -- /bin/sh -c 'echo $PODNAME'
kubectl exec -ti $PO -- /bin/sh -c 'echo $MY_CPU_REQUEST'
kubectl exec -ti $PO -- cat /etc/podinfo/labels
kubectl exec -ti $PO -- cat /etc/podinfo/annotations
```