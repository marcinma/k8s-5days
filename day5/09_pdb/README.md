For 1.21

https://kubernetes.io/docs/concepts/workloads/pods/disruptions/

```sh
kubectl delete deploy --all
kubectl delete po --all
kubectl taint nodes k8s-playground-worker key=value:NoSchedule
kubectl create -f pdb.yml
kubectl apply -f deployment.yml
kubectl get po -o wide
kubectl drain k8s-playground-worker2 --ignore-daemonsets  --delete-emptydir-data --force

kubectl uncordon k8s-playground-worker2
kubectl get po -o wide

kubectl replace -f deployment-no-keep.yml
kubectl rollout status deploy nginx-quorum2
kubectl get po -o wide

kubectl drain k8s-playground-worker2 --ignore-daemonsets  --delete-emptydir-data --force
kubectl get po -o wide
kubectl uncordon k8s-playground-worker2
kubectl taint nodes k8s-playground-worker key=value:NoSchedule-
kubectl get po -o wide
kubectl delete deploy --all

```