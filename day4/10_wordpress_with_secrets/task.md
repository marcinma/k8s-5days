# Wordpress Task

0. Remove limit range `kubectl delete limitrange mem-limit-range`
1. Recreate wordpress with mysql using secrets and configmaps
2. Wordpress should have ingress
3. User and Password envs should come from secret in both mysql and wordpress
4. Other common env should come from configmap
5. Mysql should be statefulset
6. Consider using `envFrom`
7. On Azure there is folder `lost+found` on new mounted volumes that causes mysql to throw error. Remove this folder by using initContainers