# Recreate Python+Redis on Kubernetes


1. Create Deployment for redis
2. Create Deployment for marcinmakowski/python-api:redis
3. Create service for each of those deployments.
4. Access to python with port-forward and check `/api/v1/info` endpoint

# Recreate wordpress + mysql

1. Create Deployment for mysql:5.7
2. Create Deployment for wordpress:php7.4
3. Create service for each of those deployments.
4. Access to wordpress with port-forward 
