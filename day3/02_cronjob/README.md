# Cronjob
A CronJob creates Jobs on a repeating schedule.

[crontab.guru](https://crontab.guru/#*/1_*_*_*_*)

```sh
kubectl get cronjob
kubectl create -f cronjob.hello.yaml
kubectl get cronjob
kubectl get job -l origin=cron
kubectl get pod -l origin=cron-job
kubectl logs -l origin=cron-job
kubectl create job --from=cronjob/hello my-new-job
kubectl get job -l origin=cron
kubectl delete -f cronjob.hello.yaml
kubectl get job -l origin=cron
kubectl get pod -l origin=cron-job

```



Consider missing resources

CronJob can easily lock your node

K8S CronJob vs Application with internal scheduler

