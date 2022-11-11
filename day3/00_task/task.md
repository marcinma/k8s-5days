# Recreate Python+Redis on Kubernetes


1. Create Deployment for redis
2. Create Deployment for marcinmakowski/python-api:redis
3. Create service for each of those deployments. Service for python should be NodePort
4. Access to python with port-forward and check `/api/v1/info` endpoint
5. Access to python with node port 

# Recreate wordpress + mysql

1. Create Deployment for mysql:5.7
2. Create Deployment for wordpress:php7.4
3. Create service for each of those deployments. Service for wordpress should be NodePort
4. Access to wordpress with port-forward 
5. Access to wordpress with node port 